class ChangeDatatypesOnGyms < ActiveRecord::Migration[6.1]
  def change
    remove_column :gyms, :integer
    remove_column :gyms, :location_lat
    remove_column :gyms, :location_lng
    add_column :gyms, :location_lat, :decimal
    add_column :gyms, :location_lng, :decimal
  end
end
