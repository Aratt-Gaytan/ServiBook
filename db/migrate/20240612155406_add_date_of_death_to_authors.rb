class AddDateOfDeathToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :date_of_death , :string
  end
end
