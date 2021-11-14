class AddFavoriteToGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :gyms, :favorite, :boolean
  end
end
