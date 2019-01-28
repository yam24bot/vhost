class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def all_tags=(names)
    #names = "ruby, c++"
    #post.tags.size - количество тегов
    self.tags = names.split(', ').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def self.tagged_with(name)
    # tag = Tag.find_by(name: "ruby")
    # User.tagged_with("ruby")
    Tag.find_by(name: name).users
  end

  def all_tags
    tags.map(&:name).join(' ')
  end

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def admin?
    admin
  end

validates :first_name, presence: true

mount_uploader :avatar, AvatarUploader
end
