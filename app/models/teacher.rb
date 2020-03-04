class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teach_offers
  has_many :comment, dependent: :destroy

  validates :graduate,:address, :subject, :address,:level_study, presence: true

  has_one_attach :diploma
end
