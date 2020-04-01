class Admin::ChartsController < AdminController
  def teach_offers_approved
    render json: TeachOffer.approved.includes(:demand).group_by_day(:updated_at).sum(:fee)
  end
end
