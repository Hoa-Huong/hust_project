module Admin::TeachersHelper
  def amount_offer teacher
    teacher.teach_offers.size
  end
end
