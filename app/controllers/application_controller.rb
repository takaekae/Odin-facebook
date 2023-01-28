class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def profile_pic(user) #returns an img url for the user and provides a default profile pic if none exists
    begin
      url_for(user.profile.avatar)
    rescue
      "default_avatar.png"
    end
  end

  helper_method :profile_pic

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
  end
end
