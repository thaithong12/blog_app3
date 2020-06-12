class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :image_url, default: "https://www.pngitem.com/pimgs/m/421-4213053_default-avatar-icon-hd-png-download.png"
      t.datetime :birthday
      t.string :address
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
