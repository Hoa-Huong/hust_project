class TeachersController < ApplicationController
  before_action :teacher, only: [:show]

  def index
    @teachers = Teacher.page(params[:page]).per Settings.num_teacher_index
  end

  def show
  end

  private

  def teacher
    @teacher = Teacher.find_by id: params[:id]
    return if @teacher

    flash[:danger] = "not found"
    redirect_to teachers_path
  end
end
