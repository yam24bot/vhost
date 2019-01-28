class User < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def all_tags=(names)
    self.tags = names.split(', ').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.find_by(name: name).users
  end

  def all_tags
    tags.map(&:name).join(' ')
  end

  def admin?
    admin
  end

end
