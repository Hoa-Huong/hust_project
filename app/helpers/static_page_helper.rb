module StaticPageHelper
  def total_user
    User.all.size
  end

  def total_new_offer
    TeachOffer.pending.size
  end

  def total_new_demand
    Demand.pending.size
  end

  def revenue
    result = 0
    Demand.found.map do |demand|
      result += demand.fee
    end
    result
  end
end
