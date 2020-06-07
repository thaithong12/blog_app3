class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.datetime :review_date
      t.integer :rate
      t.references :User, null: false, foreign_key: true
      t.references :Book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :book_id], unique: true
  end
end
