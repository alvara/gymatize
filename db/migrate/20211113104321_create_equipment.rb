class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :how_to_use
      t.string :brand

      t.timestamps
    end
  end
end
