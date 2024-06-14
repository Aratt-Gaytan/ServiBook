class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.date :publication_year
      t.string :copies_available
      t.string :int
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
