class CreateFavoriteBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_books, [:user_id, :book_id], unique: true
  end
end
