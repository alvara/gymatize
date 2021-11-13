class Gym < ApplicationRecord
  has_many :equipments, through: :owned_equipment
  has_many :gym_reviews, dependent: :destroy

  validates :name, presence: true
end
