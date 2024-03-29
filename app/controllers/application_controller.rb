class ApplicationController < ActionController::Base
  before_action :authenticate_member!, :only => [:deal, :deals_form]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:signin)}
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :nickname, :password, :password_confirmation)}
    end
end
