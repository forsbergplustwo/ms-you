class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maximum: 30}
  validates :created_at, presence: true

  encrypts :title
  encrypts :description
end
