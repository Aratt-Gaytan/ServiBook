class AddDefaultRoleIdToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :role_id, from: nil, to: 2
  end
end
