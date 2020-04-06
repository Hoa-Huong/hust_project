class TeachersController < ApplicationController
  before_action :teacher, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @q = Teacher.search(params[:q])
    @teachers = @q.result.page(params[:page]).per Settings.num_teacher_index
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new teacher_params
    @teacher.user_id = current_user.id
    if @teacher.save
      @teacher.user.update role: Settings.role_teacher
      flash[:success] = t "be_teacher_success"
      redirect_to teacher_good_demand_path teacher_id: @teacher.id
    else
      flash[:danger] = t "be_teacher_fail"
      render :new
    end
  end

  def show
    @comments = @teacher.comments.includes(:user).includes(user: [:avatar_attachment, :avatar_blob])
    @comment = current_user.comments.new if user_signed_in?
  end

  private

  def teacher_params
    params.require(:teacher).permit(:user_id,:diploma, :graduate, :address, :subject, :level_study, :province_id, :district_id, :introduce)
  end

  def teacher
    @teacher = Teacher.find_by id: params[:id]
    return if @teacher

    flash[:danger] = "not found"
    redirect_to teachers_path
  end
end
