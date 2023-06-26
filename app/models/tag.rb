class Tag < ApplicationRecord
  has_many :cosmetic_tags, dependent: :destroy
  has_many :cosmetics, through: :cosmetic_tags
end
