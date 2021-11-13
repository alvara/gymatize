class CreateGymReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :gym_reviews do |t|
      t.references :gym, null: false, foreign_key: true
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
