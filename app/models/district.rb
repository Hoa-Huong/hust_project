class District < ApplicationRecord
  has_many :demands
  has_one :province

  validates :name, presence: true
end
