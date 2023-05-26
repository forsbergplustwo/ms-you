class Symptom < ApplicationRecord
  enum severity: { gone: 0, mild: 1, moderate: 2, severe: 3 }
  has_many :measurements, dependent: :destroy

  after_create :create_starting_measurement
  after_update :create_update_measurement

  def create_starting_measurement
    create_measurement(start_date)
  end

  def create_update_measurement
    create_measurement(Time.now)
  end

  def create_measurement(date)
    Measurement.create!(symptom: self, severity: self.severity_before_type_cast, created_at: date, updated_at: date)
  end

end
