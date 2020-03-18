class Admin::TeachersController < AdminController
  before_action :teacher, only: [:show, :destroy]
  def index
    @teachers = Teacher.all
  end

  def show
    @demands = @teacher.user.demands
  end

  def destroy
    begin
      @teacher.destroy!
      flash[:success] = t "del_user_success"
    rescue StandardError
      flash[:danger] = t "del_user_fail"
    ensure
      redirect_to admin_teachers_path
    end
  end

  private

  def teacher
    @teacher = Teacher.find_by id: params[:id]
    return if @teacher

    flash[:danger] = t "not_found_teacher"
    redirect_to admin_teachers_path
  end
end
