class ChangeCopiesAvailableDataType < ActiveRecord::Migration[7.1]
  def change
    change_column  :books, :copies_available , :integer

  end
end
