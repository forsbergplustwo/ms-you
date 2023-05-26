class Symptom < ApplicationRecord
  enum severity: { gone: 0, mild: 1, moderate: 2, severe: 3 }
  has_many :measurements, dependent: :destroy

  after_save :create_measurement

  def create_measurement
    Measurement.create!(symptom: self, severity: self.severity_before_type_cast)
  end
end
