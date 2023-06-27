class User < ApplicationRecord
  include Clearance::User
  include Rails.application.routes.url_helpers

  has_many :symptoms, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :measurements, through: :symptoms

  encrypts :email, deterministic: true

  AVAILABLE_LANGUAGES = [
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
    "Pirate"
  ].freeze

  validates :preferred_language, inclusion: {in: AVAILABLE_LANGUAGES + AVAILABLE_LANGUAGES_FOR_FUN}

  def chart_by_day_and_severity_for_all_symptoms
    Measurement.by_day_and_severity(self, measurements)
  end

  def chart_by_day_for_all_notes
    notes.collect { |note| {x: note.created_at.to_i * 1000, text: "<a href='#{edit_note_path(note, back_to: symptoms_path)}'>#{note.title}</a>"} }
  end
end
