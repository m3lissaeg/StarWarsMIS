class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  before_action :authenticate_user!

  before_action only: %i[ new edit create update destroy ] do
    redirect_to "static_pages#error404" unless 
    :devise_controller? || (current_user && current_user.admin) 
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
