class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  before_action :authenticate_user!

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:phone,:name,:rank,:jedi,:admin])
  end

  private

  def layout_by_resource
    if devise_controller?
      "public"
    else
      "application"
    end
  end

end
