class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_params

  def create
    super
    resource.avatar.attach(params[:avatar])
  end

  protected

  def configure_permitted_params
    attr_sign_up_params = [:name, :email, :birth, :phone, :password, :password_confirmation, :avatar]
    attr_account_update_params = attr_sign_up_params << :current_password
    devise_parameter_sanitizer.permit :sign_up, keys: attr_sign_up_params
    devise_parameter_sanitizer.permit :account_update, keys: attr_account_update_params
  end

end
