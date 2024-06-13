class AddBiographyToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :biography, :string
  end
end
