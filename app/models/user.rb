class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :validatable,
         :trackable, :confirmable, :timeoutable, timeout_in: 20.minutes
  belongs_to :role

  protected
  def confirmation_required?
    false
  end

end
# app/models/user.rb
