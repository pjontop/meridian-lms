class AddRoleAndProfileToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :profile_picture_url, :string
    add_index :users, :role
  end
end
