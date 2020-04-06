class InviteItem < ApplicationRecord
  belongs_to :demand
  belongs_to :invite

  enum status: {pending: 0, yes:1, no: 2}
end
