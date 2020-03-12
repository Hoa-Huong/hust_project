class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :teacher
  before_action :comment, only: [:edit, :update, :destroy]

  def new
    @comment = @teacher.comments.new
  end

  def create
    @comment = @teacher.comments.new params_comment
    @comment.user_id = current_user.id
    if @comment.save
      respond_to :js
    else
      respond_to do |format|
        format.js{render "alert(#{t('create_comment_fail')});"}
      end
    end
  end

  def edit
    respond_to :js
  end

  def update
    if @comment.update params_comment
      respond_to :js
    else
      flash[:danger] = t "update_comment_fail"
      redirect_to teacher_path @teacher
    end
  end

  def destroy
    if @comment.destroy
      respond_to :js
    else
      flash[:danger] = t "del_comment_fail"
      redirect_to teacher_path @teacher
    end
  end

  private

  def params_comment
    params.require(:comment).permit(:user_id, :teacher_id, :content)
  end

  def teacher
    @teacher = Teacher.find_by id: params[:teacher_id]
    return if @teacher

    flash[:danger] = t "not_found_teacher"
    redirect_to root_url
  end

  def comment
    @comment = Comment.find_by id: params[:id]
    return if @comment

    flash[:danger] = t "comment_not_found"
    redirect_to root_url
  end
end
