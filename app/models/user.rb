class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :validatable,
         :trackable, :confirmable, :timeoutable, timeout_in: 20.minutes
  belongs_to :role

  def after_sign_in_path_for(resource)
    if resource.confirmed?
      super # Redirige al destino por defecto (configurado en Devise)
    else
      new_user_confirmation_path # Redirige a la página de confirmación
    end
  end
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
# app/models/user.rb
