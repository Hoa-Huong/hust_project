class TeachersController < ApplicationController
  before_action :teacher, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @teachers = Teacher.page(params[:page]).per Settings.num_teacher_index
  end

  def new
    @teacher = Teacher.new
  end

  def create
    byebug
    @teacher = Teacher.new teacher_params
    @teacher.user_id = current_user.id
    if @teacher.save
      flash[:success] = t "be_teacher_success"
      redirect_to demands_path
    else
      flash[:danger] = t "be_teacher_fail"
      render :new
    end
  end

  def show
    @comments = @teacher.comments
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
