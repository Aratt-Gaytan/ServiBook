class CreateEstatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :estatuses do |t|
      t.string :name

      t.timestamps
    end

    # Seed initial statuses
    reversible do |dir|
      dir.up do
        Estatus.create(name: 'activo')
        Estatus.create(name: 'devuelto')
        Estatus.create(name: 'atrasado')
      end
    end
  end
end
