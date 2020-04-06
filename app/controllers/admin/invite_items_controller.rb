class Admin::InviteItemsController < AdminController
  def index
    @invite_items = InviteItem.includes( demand: [:user], invite: [:teacher], teacher: [:user])
  end
end
