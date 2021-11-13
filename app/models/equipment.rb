class Equipment < ApplicationRecord
  has_many :owned_equipment
  has_many :gyms, through: :owned_equipment
end
