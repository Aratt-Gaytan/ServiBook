class AddSlugToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :slug, :string
    add_index :loans, :slug, unique: true
  end
end
