class InviteItemsController < ApplicationController
  before_action :invite, :demand, only: :create
  before_action :invite_item, only: [:destroy, :update_status]

  def create
    @invite_item = InviteItem.new demand_id: @demand.id, invite_id: @invite.id

    if @invite_item.save
      respond_to :js
    else
      respond_to do |format|
        format.js { flash.now[:danger] = t "create_demand_fail" }
      end
    end
  end

  def destroy
    @demand = @invite_item.demand
    @invite = @invite_item.invite
    if @invite_item.destroy
      respond_to :js
    else
      respond_to do |format|
        format.js { flash.now[:danger] = t "del_demand_fail" }
      end
    end
  end

  def update_status
    if @invite_item.update(status: params[:status])
      if @invite_item.yes?
        flash[:notice] = t "you_agree"
      else
        flash[:notice] = t "you_disagree"
      end
      UserMailer.send_notification_invitation_to_demander(@invite_item).deliver_now
    else
      flash[:danger] = t "update_invite_item_fail"
    end
      redirect_to invite_path @invite_item.invite
  end

  private

  def invite
    @invite = Invite.find_by id: params[:invite_id]
    return if @invite

    flash[:danger] = t "not_found_invite"
    redirect_to root_url
  end

  def demand
    @demand = Demand.find_by id: params[:demand_id]
    return if @demand

    flash[:danger] = t "demand_not_found"
    redirect_to root_url
  end

  def invite_item
    @invite_item = InviteItem.find_by id: params[:id]

    return if @invite_item

    flash[:danger] = t "not_found_invite_item"
    redirect_to root_url
  end
end
