class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  default_scope {order created_at: :desc }

  delegate :name, :avatar, to: :user, prefix: true
end
