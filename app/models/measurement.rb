class Measurement < ApplicationRecord
  belongs_to :symptom

  def self.all_by_day_and_severity
    all.group_by_day(:created_at).sum(:severity).reject { |k, v| v == 0 }
  end
end
