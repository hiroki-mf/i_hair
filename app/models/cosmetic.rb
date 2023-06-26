class Cosmetic < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :cosmetic_tags, dependent: :destroy
  has_many :tags, through: :cosmetic_tags
end
