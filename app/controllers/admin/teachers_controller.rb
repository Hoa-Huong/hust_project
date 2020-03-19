class Admin::TeachersController < AdminController
  before_action :teacher, only: [:show, :destroy]
  before_action :teacher_demand, :demand, only: :destroy_demand
  def index
    @teachers = Teacher.includes(:user, :teach_offers)
  end

  def show
    @demands = @teacher.user.demands
    @teach_offers = @teacher.teach_offers
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

  def destroy_demand
    if @demand.destroy
      flash[:success] = t "del_demand_success"
    else
      flash[:danger] = t "del_demand_fails"
    end
    redirect_to admin_teacher_path @teacher
  end

  private

  def teacher
    @teacher = Teacher.find_by id: params[:id]
    return if @teacher

    flash[:danger] = t "not_found_teacher"
    redirect_to admin_teachers_path
  end

  def teacher_demand
    @teacher = Teacher.find_by id: params[:teacher_id]

    return if @teacher

    flash[:danger] = t "not_found_user"
    redirect_to admin_dashboard_path
  end

  def demand
    @demand = Demand.find_by id: params[:demand_id]
    return if @demand

    flash[:danger] = t "not_found_demand"
  end
end
