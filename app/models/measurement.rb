class Measurement < ApplicationRecord
  belongs_to :symptom
  has_one :user, through: :symptom

  validates :symptom, presence: true
  validates :severity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4}
  validates :created_at, presence: true

  encrypts :description

  SEVERITIES_MAPPING = {
    0 => :none,
    1 => :mild,
    2 => :moderate,
    3 => :severe,
    4 => :critical
  }

  def self.by_day_and_severity(user, records)
    days = records.group_by { |m| m.created_at.to_date }

    # days = days.transform_keys { |k| k - 1.days }.merge(days)
    days[Date.today] = {} if days[Date.today].nil?
    days[days.keys.min - 1.day] = {}

    days.map do |day, measurements|
      day_sum = 0
      user.symptoms.find_each do |symptom|
        day_sum += symptom.severity_on_day(day)
      end
      day_integer = day.to_time.to_i * 1000
      {
        id: day_integer.to_s,
        x: day_integer,
        y: day_sum
      }
    end.sort_by { |day| day[:x] }
  end
end
