class Admin::CommentsController < AdminController
  before_action :comment, only: :destroy

  def index
    @comments = Comment.includes(:user)
  end

  def new
    respond_to :js
  end

  def create
    @comment = current_user.comments.new params_comment
    if @comment.save
      flash[:success] = t "create_comment_success"
    else
      flash[:success] = t "create_comment_fail"
    end
    redirect_to admin_comments_path
  end

  def destroy
    if @comment.destroy
      respond_to :js
    else
      respond_to do |format|
        format.js{render "alert(#{t('del_comment_fail')});"}
      end
    end
  end

  private

  def comment
    @comment = Comment.find_by id: params[:id]
    return if @comment

    flash[:danger] = t "not_found_comment"
  end

  def params_comment
    params.require(:comment).permit(:content, :teacher_id, :user_id)
  end
end
