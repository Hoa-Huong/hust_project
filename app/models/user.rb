class User < ApplicationRecord
  ratyrate_rater

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :confirmable

  has_many :demands, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :teacher, dependent: :destroy

  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 100}
  validates :phone, presence: true, length: {maximum: 15}
  validates :email, :encrypted_password, presence: true, on: :create

  enum role: {admin: 0, user: 1}

  accepts_nested_attributes_for :teacher, reject_if: :all_blank, update_only: true

  def teacher?
    teacher.present?
  end

end
