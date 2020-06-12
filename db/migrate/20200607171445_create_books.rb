class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :image_url
      t.text :description
      t.datetime :publish_date
      t.string :author
      t.float :rating , default: 0
      t.integer :status , default: 0
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
