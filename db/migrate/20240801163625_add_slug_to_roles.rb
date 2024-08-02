class AddSlugToRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :slug, :string
    add_index :roles, :slug, unique: true
  end
end
