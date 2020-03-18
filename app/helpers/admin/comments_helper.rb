module Admin::CommentsHelper
  def load_teacher
    Teacher.joins(:user).pluck(:name, :id)
  end
end
