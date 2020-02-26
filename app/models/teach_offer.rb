class TeachOffer < ApplicationRecord
  belongs_to :teacher
  belongs_to :demand

  enum status: {pending: 0, approved: 1, unapproved: 2}

  delegate :title, to: :demand, prefix: true

  default_scope {order created_at: :desc }
end
