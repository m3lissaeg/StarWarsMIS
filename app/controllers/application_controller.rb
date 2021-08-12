class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:phone,:name,:rank,:jedi,:admin])
  end

  private

  def layout_by_resource
    if devise_controller? && action_name == "new" || "show"
      "public"
    else
      "application"
    end
  end

end
