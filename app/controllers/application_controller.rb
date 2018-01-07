class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # Protect from XSS attacks
  before_action :authenticate_user!

  def configure_permitted_parameters, if: :devise_controller?
    devise_parameter_sanitizer.permit(:sign_up, keys: [:restaurant_name])
  end
end
