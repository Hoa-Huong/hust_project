class Admin::TeachOffersController < AdminController
  before_action :teach_offer, only: [:show, :destroy, :update, :edit]

  def index
    @teach_offers = TeachOffer.includes(:teacher, :user,:demand).includes(teacher: [:user])
  end

  def show
    @demand = @teach_offer.demand
    @teacher = @teach_offer.teacher
  end

  def edit
    respond_to :js
  end

  def update
    @user = @teach_offer.user
    @teacher = @teach_offer.teacher
    if @teach_offer.update(status: params[:status])
      if params[:status] == "approved"
        @teach_offer.demand.update status_teach: Settings.status_teach_found
        UserMailer.notify_status_teach_demand(@user).deliver_now
      end
        UserMailer.notify_status_teach_offer(@teacher, @teach_offer).deliver_now
    else
      flash[:danger] = t "update_teach_offer_fail"
    end
    redirect_to admin_teach_offers_path
  end

  def destroy
    if @teach_offer.destroy
      flash[:success] = t "del_offer_success"
    else
      flash[:danger] = t "del_offer_fail"
    end
    redirect_to admin_teach_offers_path
  end

  private

  def teach_offer
    @teach_offer = TeachOffer.find_by id: params[:id]
    return if @teach_offer

    flash[:danger] = t "not_found_teach_offer"
  end
end
