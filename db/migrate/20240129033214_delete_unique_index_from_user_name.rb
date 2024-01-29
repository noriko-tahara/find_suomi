class DeleteUniqueIndexFromUserName < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, column: :name, unique: true
  end
end
