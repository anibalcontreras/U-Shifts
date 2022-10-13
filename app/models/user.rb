class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :requests
  has_many :members
  has_many :turnos, through: :members
  has_many :resenas
  has_many :messages
  has_many :chats, through: :messages

  validates :name, length: { minimum: 2 }
  validates :username, length: { minimum: 2 }, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  validates :direccion, length: { minimum: 5 }
  validates :phone, length: { minimum: 9 }
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :image, presence: true
end
