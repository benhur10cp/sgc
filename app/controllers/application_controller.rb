class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_member!

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "admin_devise"
    elsif devise_controller? && resource_name == :member
      "site_devise"
    else
      "application"
    end
  end

end
