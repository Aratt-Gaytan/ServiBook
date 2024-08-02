class AddSlugToStatuses < ActiveRecord::Migration[7.1]
  def change
    add_column :statuses, :slug, :string
    add_index :statuses, :slug, unique: true
  end
end
