class CreateFacilityGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :facility_genres do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
    add_index :facility_genres, [:facility_id, :genre_id], unique: true
  end
end
