module DemandsHelper
  def check_offer_presence demand, user
    return false unless demand.teach_offers.present? && user.teacher.present?

    @teach_offer = demand.teach_offers.find_by teacher_id: user.teacher.id
  end
end
