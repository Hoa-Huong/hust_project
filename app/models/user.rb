class User < ApplicationRecord
  has_many :demands
  has_many :comments
  has_one :teacher

end
