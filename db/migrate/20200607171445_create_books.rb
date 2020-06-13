class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :image_url
      t.text :description
      t.datetime :publish_date
      t.string :author
<<<<<<< HEAD
      t.float :rating
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

=======
      t.float :rating , default: 0
      t.integer :status , default: 0
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
>>>>>>> 22ae0aaed3cc7406d89b6a8f93fed72d1d80b8b8
      t.timestamps
    end
  end
end
