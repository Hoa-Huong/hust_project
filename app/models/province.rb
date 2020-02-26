class Province < ApplicationRecord
  has_many :demands
  has_many :districts

  validates :name, presence: true
end
