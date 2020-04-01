class Admin::ChartsController < AdminController
  def teach_offers_approved
    render json: TeachOffer.approved.includes(:demand).group_by_day(:updated_at).sum(:fee)
  end

  def index
    @teach_offers = TeachOffer.approved.includes(:demand)
  end
end
