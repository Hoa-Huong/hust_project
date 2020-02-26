class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable
  has_many :demands
  has_many :comments
  has_one :teacher

  validates :name, presence: true, length: {maximum: 100}
  validates :phone, presence: true, length: {maximum: 15}
  validates :avatar, presence: true

  has_one_attached :avatar
end
