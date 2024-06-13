class PopulateRoles < ActiveRecord::Migration[7.1]

  def up
    roles = ['admin', 'user']
    roles.each do |role|
      Role.create(name: role)
    end

    # Opcional: Asignar un role_id a los usuarios existentes
    default_role = Role.find_by(name: 'user')
    User.update_all(role_id: default_role.id)
  end

  def down
    Role.delete_all
  end
end
