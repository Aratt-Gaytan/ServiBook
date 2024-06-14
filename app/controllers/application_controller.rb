class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone , :address])
  end
  def check_user_role
    unless current_user.role_id == 1
      render file: "#{Rails.root}/public/422.html", status: :unprocessable_entity
    end
  end
end
