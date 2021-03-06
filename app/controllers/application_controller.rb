class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :avater, :profile]
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
end
