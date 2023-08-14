class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :remove_authentication_flash_message_if_root_url_requested
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end
end
