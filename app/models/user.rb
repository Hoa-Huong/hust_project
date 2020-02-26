class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable
  has_many :demands, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :teacher, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 100}
  validates :phone, presence: true, length: {maximum: 15}

  enum role: {admin: 0, user: 1}

end
