class Symptom < ApplicationRecord
  has_many :measurements, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :measurements, reject_if: :all_blank

  validates :user, presence: true
  validates :title, presence: true

  def current_severity
    latest_measurement&.severity || 0
  end

  def current_description
    latest_measurement&.description
  end

  def current_measured_date
    latest_measurement&.measured_at&.to_date
  end

  def severity_on_day(day)
    measurements.where("measured_at <= ?", day).order(measured_at: :desc).first&.severity || 0
  end

  def chart_by_day_and_severity
    days = measurements.group_by{|m| m.measured_at.to_date }

    # days = days.transform_keys { |k| k - 1.days }.merge(days)
    days[Date.today] = {} if days[Date.today].nil?
    days[days.keys.min - 1.day] = {}
    days.map do |day, _measurements|
      day_integer = day.to_time.to_i * 1000
      {
        id: day_integer.to_s,
        x: day_integer,
        y: severity_on_day(day)
      }
    end.sort_by { |day| day[:x] }
  end

  private

  def latest_measurement
    measurements.order(measured_at: :desc).first
  end

end
