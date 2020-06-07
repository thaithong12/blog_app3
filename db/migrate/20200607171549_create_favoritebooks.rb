class CreateFavoritebooks < ActiveRecord::Migration[6.0]
  def change
    create_table :favoritebooks do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favoritebooks, [:user_id, :book_id], unique: true
  end
end
