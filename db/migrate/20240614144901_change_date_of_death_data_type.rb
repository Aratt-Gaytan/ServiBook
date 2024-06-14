class ChangeDateOfDeathDataType < ActiveRecord::Migration[7.1]
  def change
    change_column  :authors, :date_of_death , :date
  end
end
