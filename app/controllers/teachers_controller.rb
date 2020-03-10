class TeachersController < ApplicationController
  before_action :teacher, only: [:show]
  skip_before_action :authenticate_user!

  def index
    @teachers = Teacher.page(params[:page]).per Settings.num_teacher_index
  end

  def show
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
