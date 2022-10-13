class Request < ApplicationRecord
  belongs_to :solicitante, class_name: 'User', optional: true
  belongs_to :turno
  validates :descripcion, length: { minimum: 5 }
end
