class Demand < ApplicationRecord
  belongs_to :user
  has_many :teach_offer, dependent: :destroy
  belongs_to :province
  belongs_to :district

  validates :subject, :title, presence: true, length: {maximum: 100}
  validates :number_student, :fee, presence: true, numericality: { only_integer: true }
  validates :time_per_session, :level_class, :note, :address_detail, presence: true

  enum status: {pending: 0, approved: 1, unapproved: 2}
  enum status_teach: {found: 1, notFound: 0}

  delegate :name, :phone, to: :user, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :district, prefix: true

  default_scope {order created_at: :desc }
  scope :demand_approved, -> {where status: 1}
end
