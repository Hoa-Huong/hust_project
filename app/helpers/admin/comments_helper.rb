module Admin::CommentsHelper
  def teacher_options
    Teacher.joins(:user).pluck(:name, :id)
  end
end
