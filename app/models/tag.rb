class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :users, through: :taggings
end
