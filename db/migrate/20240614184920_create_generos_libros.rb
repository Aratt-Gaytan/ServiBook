class CreateGenerosLibros < ActiveRecord::Migration[7.1]
  def change
    create_table :generos_libros do |t|
      t.references :genre, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
