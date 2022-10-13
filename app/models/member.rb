class Member < ApplicationRecord
  # belongs_to :chat
  # validates :username, length: { minimum: 2 }, presence: true, uniqueness: true
  # validates :turno_id, numericality: { greater_than_or_equal_to: 1 }
  belongs_to :turno
  belongs_to :user
end
