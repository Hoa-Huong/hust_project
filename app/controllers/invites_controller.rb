class InvitesController < ApplicationController
  before_action :teacher, only: :create
  before_action :invite, only: [:update, :show, :destroy]

  def create
    @demands = current_user.demands.notFound
    @invite = Invite.new teacher_id: @teacher.id
    if @invite.save
      respond_to :js
    else
      respond_to do |format|
        format.js { flash.now[:danger] = t "create_invite_fail" }
      end
    end
  end

  def show
    @invite_items = @invite.invite_items
  end

  def update
    @invite_items = @invite.invite_items
    if @invite_items.present?
      flash[:success] = t "invited"
      UserMailer.send_invitation_to_teacher(@invite.teacher, @invite).deliver_now
      redirect_to teacher_path @invite.teacher
    else
      respond_to do |format|
        format.js { flash.now[:danger] = t "pick_demand" }
      end
    end
  end

  def destroy
    unless @invite.destroy
      flash[:danger] = t "del_fail_invite"
    end
      redirect_to teacher_path @invite.teacher
  end

  private

  def teacher
    @teacher = Teacher.find_by id: params[:teacher_id]
    return if @teacher

    flash[:danger] = t "not_found_teacher"
    redirect_to teachers_path
  end

  def invite
    @invite = Invite.find_by id: params[:id]
    return if @invite

    flash[:danger] = t "not_found_invite"
    redirect_to root_url
  end
end
