class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teach_offers
  has_many :comment
end
