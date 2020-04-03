class Invite < ApplicationRecord
  belongs_to :teacher
  has_many :invite_items, dependent: :destroy
  has_many :demands, through: :invite_items

end
