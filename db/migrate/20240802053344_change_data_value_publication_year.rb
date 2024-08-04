class ChangeDataValuePublicationYear < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :publication_year
    add_column :books, :publication_year, :string
  end
end
