class TeachOffersController < ApplicationController
  before_action :choosen_demand, only: %i(create)
  before_action :check_teacher, only: %i(create index)
  before_action :teach_offer, only: :destroy

  def index
    @teach_offers = current_user.teacher.teach_offers.page(params[:page])
  end

  def create
    @teach_offer = current_user.teacher.teach_offers.find_by demand_id: @choosen_demand.id
    if @teach_offer
      respond_to do |format|
        format.js { flash.now[:danger] = t "offer_before" }
      end
    else
      @teach_offer = current_user.teacher.teach_offers.create demand_id: @choosen_demand.id
      respond_to do |format|
        format.js { flash.now[:success] = t "teach_offer_success" }
      end
    end
  end

  def destroy
    if @teach_offer.destroy
      flash[:success] = t "del_offer_success"
    else
      flash[:danger] = t "del_offer_fail"
    end
    redirect_to teach_offers_path
  end

  private

  def choosen_demand
    @choosen_demand = Demand.find_by id: params[:demand_id]
    return if @choosen_demand

    flash[:danger] = t "demand_not_found"
  end

  def check_teacher
    return if current_user.teacher?
    flash[:notice] = t "not_be_teacher"
    redirect_to new_teacher_path

  end

  def teach_offer
    @teach_offer = TeachOffer.find_by id: params[:id]
    return if @teach_offer

    flash[:danger] = t "not_found_teach_offer"
    redirect_to teach_offers_path
  end
end
