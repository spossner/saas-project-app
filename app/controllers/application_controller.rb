class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  ##
  # add subdomain to the trusted parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :subdomain])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :subdomain])
  end
end
