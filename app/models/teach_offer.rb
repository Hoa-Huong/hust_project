class TeachOffer < ApplicationRecord
  belongs_to :teacher
  belongs_to :demand
end
