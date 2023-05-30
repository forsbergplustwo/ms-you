class Symptom < ApplicationRecord
  has_many :measurements, dependent: :destroy

  accepts_nested_attributes_for :measurements, reject_if: :all_blank

  validates :title, presence: true

  def current_severity
    latest_measurement&.severity || 0
  end

  def current_description
    latest_measurement&.description
  end

  def severity_on_day(day)
    measurements.where("measured_at <= ?", day).order(measured_at: :desc).first&.severity || 0
  end

  def chart_by_day_and_severity
    days = measurements.group_by{|m| m.measured_at.to_date }
    # days = days.transform_keys { |k| k - 3.days }.merge(days)
    days.map do |day, measurements|
      [day, severity_on_day(day)]
    end.sort
  end

  private

  def latest_measurement
    measurements.order(measured_at: :desc).first
  end

end
