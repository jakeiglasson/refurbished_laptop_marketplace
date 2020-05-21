class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Send the user to a 403 page when they try to access a resource they arent allowed to
  rescue_from CanCan::AccessDenied do |_exception|
    render file: "#{Rails.root}/public/403.html", status: :forbidden, layout: false
  end

  # Catch all case for records that dont exist
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render file: "#{Rails.root}/public/404.html", status: :forbidden, layout: false
  end

  protected

  def configure_permitted_parameters
    attributes = [:name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
