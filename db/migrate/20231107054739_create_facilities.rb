class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.text :description
      t.string :opening_hour
      t.string :closed_on
      t.string :website
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
