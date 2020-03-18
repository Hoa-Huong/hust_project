class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teach_offers
  has_many :comments, dependent: :destroy
  belongs_to :province
  belongs_to :district
  has_many :teach_offers, dependent: :restrict_with_exception

  ratyrate_rateable "point"

  validates :graduate,:address, :subject,:level_study, :introduce, presence: true

  has_one_attached :diploma

  delegate :avatar,:name, :birth, :email, :phone,  to: :user, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :district, prefix: true
end
