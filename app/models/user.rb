class User < ApplicationRecord
  include Clearance::User

  encrypts :email, deterministic: true

  has_many :symptoms, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :measurements, through: :symptoms

  AVAILABLE_LANGUAGES =[
    "Danish",
    "English",
    "Finnish",
    "French",
    "German",
    "Icelandic",
    "Italian",
    "Japanese",
    "Norwegian",
    "Portuguese",
    "Spanish",
    "Swedish",
    "Ukrainian"
  ].freeze

  AVAILABLE_LANGUAGES_FOR_FUN = [
    "Pirate",
  ].freeze


  def chart_by_day_and_severity_for_all_symptoms
    Measurement.by_day_and_severity(self, measurements)
  end
end
