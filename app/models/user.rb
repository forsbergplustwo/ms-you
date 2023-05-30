class User < ApplicationRecord
  include Clearance::User
  has_many :symptoms, dependent: :destroy
  has_many :measurements, through: :symptoms

  AVAILABLE_LANGUAGES =[
    "English",
    "Spanish",
    "French",
    "German,",
    "Pirate Speak"
  ].freeze


  def chart_by_day_and_severity_for_all_symptoms
    Measurement.by_day_and_severity(self, measurements)
  end
end
