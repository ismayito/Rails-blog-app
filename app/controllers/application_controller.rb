class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_sign_in_permitted_parameters, if: :devise_controller?

  private

  # Permits user name on top of authenticated email allowed by default on sign up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:Name])
  end

  # Permits user name on top of authenticated email allowed by default on login/sign_in
  def configure_sign_in_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:Name])
  end
  # helper_method :current_user

  # private

  # def current_user
  #   @current_user ||= User.first
  # end
end
