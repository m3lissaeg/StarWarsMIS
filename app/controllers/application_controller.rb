class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  before_action :authenticate_user!

  def render_not_found
    render file: "public/404.html",  status: 404
  end

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
