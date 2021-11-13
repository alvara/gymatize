class OwnedEquipment < ApplicationRecord
  belongs_to :gym
  belongs_to :equipment
end
