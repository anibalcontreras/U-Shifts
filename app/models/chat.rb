class Chat < ApplicationRecord
  belongs_to :turno, dependent: :destroy
  has_many :messages
  has_many :users, through: :messages
  # has_many :members
end
