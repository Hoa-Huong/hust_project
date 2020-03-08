module TeachersHelper
  def total_class_studied teacher
    teacher.teach_offers.approved.size
  end
end
