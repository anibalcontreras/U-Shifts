class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :sender, class_name: 'User', optional: true

  validates :contenido, length: { minimum: 1 }
end
