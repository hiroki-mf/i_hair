class Cosmetic < ApplicationRecord
  has_many :posts, dependent: :destroy
end
