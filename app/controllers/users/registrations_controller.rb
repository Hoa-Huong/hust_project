class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_params
  after_action :attach_avatar, only: %i(create)

  def new
    build_resource({})
    resource.build_teacher
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        check_role_teacher_user
      end
    else
      resource.build_teacher if resource.teacher.blank?
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end
    resource.avatar.attach(params[:avatar])
  end

  protected

  def configure_permitted_params
    attr_sign_up_params = [:name, :email, :birth, :phone, :password, :password_confirmation, :avatar, :role,
      [teacher_attributes: [:diploma, :graduate, :address, :subject, :level_study, :province_id, :district_id, :introduce]]]
    attr_account_update_params = attr_sign_up_params << :current_password
    devise_parameter_sanitizer.permit :sign_up, keys: attr_sign_up_params
    devise_parameter_sanitizer.permit :account_update, keys: attr_account_update_params
  end

  private

  def attach_avatar
    unless resource.avatar.attached?
      resource.avatar.attach io: File.open(Rails.root.join("app", "assets", "images", "default-ava.jpeg")),
      filename: "default-ava.jpeg"
    end
  end

  def check_role_teacher_user
    if resource.role == "teacher" && resource.teacher.nil?
      flash[:danger] = t "fill_in_teacher"
      resource.build_teacher if resource.teacher.blank?
      render :new
    else
      set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      expire_data_after_sign_in!
      respond_with resource, location: after_inactive_sign_up_path_for(resource)
    end
  end
end
