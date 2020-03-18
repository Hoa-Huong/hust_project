class Admin::UsersController < AdminController
  before_action :user, except: [:index, :new, :create]
  after_action :attach_avatar, only: :create

  def index
    @users = User.demand
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params_user
    if @user.save
      flash[:success] = t "create_new_user_success"
      redirect_to admin_user_path @user
    else
      render :new
    end
  end

  def destroy
    begin
      @user.destroy!
      flash[:success] = t "del_user_success"
    rescue StandardError
      flash[:danger] = t "del_user_fail"
    ensure
      redirect_to admin_users_path
    end
  end

  private

  def user
    @user = User.find_by id: params[:id]

    return if @user

    flash[:danger] = t "not_found_user"
    redirect_to admin_dashboard_path
  end

  def params_user
    params.require(:user).permit(:name, :email, :birth, :phone, :avatar, :password, :password_confirmation)
  end

  def attach_avatar
    unless @user.avatar.attached?
      @user.avatar.attach io: File.open(Rails.root.join("app", "assets", "images", "default-ava.jpeg")),
      filename: "default-ava.jpeg"
    end
  end
end
