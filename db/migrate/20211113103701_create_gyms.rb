class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :vicinity
      t.integer :location_lat
      t.string :location_lng
      t.string :integer
      t.string :franchise
      t.integer :rating
      t.integer :user_ratings_total
      t.string :google_place_id
      t.string :business_status
      t.float :sq_ft
      t.integer :water_fountain
      t.integer :floor_count

      t.timestamps
    end
  end
end
