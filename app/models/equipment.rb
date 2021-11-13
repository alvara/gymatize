class Equipment < ApplicationRecord
  has_many :gyms, through: :owned_equipment
end
