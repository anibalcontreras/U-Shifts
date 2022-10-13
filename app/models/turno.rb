class Turno < ApplicationRecord
  belongs_to :user
  has_one :chat, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :members
  # Este user es el owner
  has_many :users, dependent: :destroy, through: :members
  has_many :resenas

  def requestd?(user)
    !!requests.find { |request| request.solicitante_id == user.id }
  end

  def resenad?(user)
    !!resenas.find { |resena| resena.user_id == user.id }
  end

  validates :descripcion, length: { minimum: 5 }
  validates :nombre_completo, presence: true, uniqueness: true
  validates :comuna, length: { minimum: 4 }
  validates :direccion_salida, length: { minimum: 5 }
  validates :limite_personas, numericality: { greater_than_or_equal_to: 1 }
  # validates :direccion, length: { minimum: 5 }
  # validates :dia_semana, length: { minimum: 5 } No es string
  # validates :hora_salida que no sea antes de que se corre la consola
  # validates :tipo,
  # inclusion: { in: %w[ida vuelta],
  #              message: '%{value} no es válido: Formato aceptado ida / vuelta' }
end
