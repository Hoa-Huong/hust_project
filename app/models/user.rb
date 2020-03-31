class User < ApplicationRecord
  ratyrate_rater

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :confirmable

  has_many :demands, dependent: :restrict_with_exception
  has_many :comments, dependent: :destroy
  has_one :teacher, dependent: :destroy
  has_many :teach_offers, through: :teacher

  has_one_attached :avatar

  validates :name, presence: true, length: {maximum: 100}
  validates :phone, presence: true, length: {maximum: 15}
  validates :password, :password_confirmation, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates :birth, :role, presence: true

  enum role: {admin: 0, demand: 1, teacher: 2}

  accepts_nested_attributes_for :teacher, reject_if: :all_blank, update_only: true

  default_scope {order created_at: :desc }

  delegate :graduate, :address, :level_study, :subject, :introduce, :diploma, to: :teacher, prefix: true

  def teacher?
    teacher.present?
  end

  def self.to_csv
    attributes = %w{name email birth phone}
    header = attributes.map { |attr| I18n.t("#{attr}") }
    CSV.generate do |csv|
      csv << header
      all.each do |user|
        csv << attributes.map{ |attr| user.public_send(attr) }
      end
    end
  end

end
