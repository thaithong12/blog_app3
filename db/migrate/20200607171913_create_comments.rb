class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.datetime :comment_date
      t.references :User, null: false, foreign_key: true
      t.references :Review, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:user_id, :review_id], unique: true
  end
end
