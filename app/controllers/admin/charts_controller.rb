class Admin::ChartsController < AdminController
  def teach_offers_approved
    render json: TeachOffer.approved.includes(:demand).group_by_day(:updated_at).sum(:fee)
  end

  def users
    render json: User.group_by_day(:created_at).count
  end

  def demands
    render json: Demand.group_by_day(:created_at).count
  end

  def teachers
    render json: Teacher.group_by_day(:created_at).count
  end

  def teach_offers
    render json: TeachOffer.group_by_day(:created_at).count
  end
end
