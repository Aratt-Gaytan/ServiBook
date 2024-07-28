class AddTrackableMigration < ActiveRecord::Migration[7.1]

  def change
    change_table :users do |t|

      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end
  end
end
