class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates :content, presence: true

  default_scope {order created_at: :desc }

  delegate :name, :avatar, to: :user, prefix: true
end
