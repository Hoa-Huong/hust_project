class AdminController < ApplicationController
  authorize_resource class: false

  layout "admin_application"

  def dashboard
    render "static_pages/dashboard"
  end
end
