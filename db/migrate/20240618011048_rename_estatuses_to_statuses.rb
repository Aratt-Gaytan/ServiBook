class RenameEstatusesToStatuses < ActiveRecord::Migration[7.1]
  def change
    rename_table :estatuses, :statuses
  end
end
