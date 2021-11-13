class CreateOwnedEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :owned_equipments do |t|
      t.references :gym, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
