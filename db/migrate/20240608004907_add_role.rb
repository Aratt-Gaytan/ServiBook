class AddRole < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role_id, :number

    change_column_default :users, :role_id, 2
  end
end
