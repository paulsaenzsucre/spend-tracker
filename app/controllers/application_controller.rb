class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_navbar_content

  def set_navbar_content
    controller = params[:controller]
    action = params[:action]
    @navbar_content = NAVBAR_CONTENT[controller][action] || 'SPEND TRACKER'
  end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to splashscreen_path
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
