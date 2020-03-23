class Teacher < ApplicationRecord
  belongs_to :user
  has_many :teach_offers
  has_many :comments, dependent: :destroy
  belongs_to :province
  belongs_to :district
  has_many :teach_offers, dependent: :restrict_with_exception

  ratyrate_rateable "point"

  validates :graduate,:address, :subject,:level_study, :introduce, presence: true

  has_one_attached :diploma

  delegate :avatar,:name, :birth, :email, :phone,  to: :user, prefix: true
  delegate :name, to: :province, prefix: true
  delegate :name, to: :district, prefix: true

  def self.to_csv
    attributes = %i{user_name user_email user_birth user_phone graduate address subject level_study}
    header = attributes.map { |attr| I18n.t("#{attr}") }
    CSV.generate do |csv|
      csv << header
      all.each do |teacher|
        csv << attributes.map{ |attr| teacher.public_send(attr) }
      end
    end
  end
end
