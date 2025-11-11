class ChangeUserRoleToString < ActiveRecord::Migration[8.0]
  def up
    # Add temporary column
    add_column :users, :role_temp, :string, default: "student", null: false
    
    # Convert existing integer roles to strings
    User.reset_column_information
    User.find_each do |user|
      case user.role
      when 0, "student"
        user.update_column(:role_temp, "student")
      when 1, "teacher"
        user.update_column(:role_temp, "teacher")
      when 2, "admin"
        user.update_column(:role_temp, "admin")
      end
    end
    
    # Remove old column and rename new one
    remove_column :users, :role
    rename_column :users, :role_temp, :role
    
    # Add index
    add_index :users, :role
  end
  
  def down
    # Add temporary integer column
    add_column :users, :role_temp, :integer, default: 0, null: false
    
    # Convert string roles back to integers
    User.reset_column_information
    User.find_each do |user|
      case user.role
      when "student"
        user.update_column(:role_temp, 0)
      when "teacher"
        user.update_column(:role_temp, 1)
      when "admin"
        user.update_column(:role_temp, 2)
      end
    end
    
    # Remove string column and rename integer one
    remove_column :users, :role
    rename_column :users, :role_temp, :role
    
    # Add index
    add_index :users, :role
  end
end
