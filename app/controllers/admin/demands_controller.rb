class Admin::DemandsController < AdminController
  before_action :demand, only: [:show, :update, :destroy]

  def index
    @demands = Demand.includes(:user)
    respond_to do |format|
      format.html
      format.xls { send_data @demands.to_csv, filename: "Demand_list.xls" }
    end
  end

  def show
  end

  def update
    if @demand.update status: params[:status]
      flash[:success] = t "update_demand_success"
    else
      flash[:danger] = t "update_demand_fail"
    end
    redirect_to admin_demand_path @demand
  end

  def destroy
    if @demand.destroy
      flash[:success] = t "del_demand_success"
    else
      flash[:danger] = t "del_demand_fail"
    end
    redirect_to admin_demands_path
  end

  private

  def demand
    @demand = Demand.find_by id: params[:id]
    return if @demand

    flash[:danger] = t "not_found_demand"
  end
end
