class AddSlugToGenres < ActiveRecord::Migration[7.1]
  def change
    add_column :genres, :slug, :string
    add_index :genres, :slug, unique: true
  end
end
