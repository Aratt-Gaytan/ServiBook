class CreateEstatuses < ActiveRecord::Migration[7.1]
  def change
    # create_table :statuses do |t|
    #   t.string :name

    #   t.timestamps
    # end


    # Seed initial statuses
    reversible do |dir|
      dir.up do
        Status.create(name: 'activo')
        Status.create(name: 'devuelto')
        Status.create(name: 'atrasado')
      end
    end
  end
end
