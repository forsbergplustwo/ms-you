class Measurement < ApplicationRecord
  belongs_to :symptom

  validates :severity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }
  validates :measured_at, presence: true

  SEVERITIES_MAPPING = {
    0 => :none,
    1 => :mild,
    2 => :moderate,
    3 => :severe
  }

  def self.chart_by_day_and_severity_for_all_symptoms
    by_day_and_severity(Measurement.all)
  end

  def self.by_day_and_severity(records)
    days = records.group_by{|m| m.measured_at.to_date }
    # days = days.transform_keys { |k| k - 1.day }.merge(days)

    days.map do |day, measurements|
      day_sum = 0
      Symptom.find_each do |symptom|
        day_sum += symptom.severity_on_day(day)
      end
      [day, day_sum]
    end.sort
  end

end
