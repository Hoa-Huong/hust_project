class Demand < ApplicationRecord
  belongs_to :user
  has_one :addresses_demand
  has_many :teach_offer
end
