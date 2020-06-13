class AddIsActivedToUsers < ActiveRecord::Migration[6.0]
  def change
<<<<<<< HEAD
    add_column :users, :is_active, :boolean
=======
    add_column :users, :is_active, :boolean, default: false
>>>>>>> 22ae0aaed3cc7406d89b6a8f93fed72d1d80b8b8
  end
end
