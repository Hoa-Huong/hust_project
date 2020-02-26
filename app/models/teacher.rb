class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teach_offers
  has_many :comment, dependent: :destroy
  belongs_to :province
  belongs_to :district

  validates :graduate,:address, :subject,:level_study, :introduce, presence: true

  has_one_attached :diploma

  delegate :avatar,:name, :birth, to: :user, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :district, prefix: true
end
