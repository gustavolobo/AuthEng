class AddRoleIdToAuthEngUsers < ActiveRecord::Migration
  def change
    add_column :auth_eng_users, :role_id, :integer
  end
end
