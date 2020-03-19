class TeachOffer < ApplicationRecord
  belongs_to :teacher
  belongs_to :demand
  has_one :user, through: :demand

  enum status: {pending: 0, approved: 1, unapproved: 2}

  delegate :title, to: :demand, prefix: true
  delegate :user_name, :user_phone, :user_email, to: :teacher, prefix: true
  delegate :user_name, to: :demand, prefix: true

  default_scope {order created_at: :desc }
end
