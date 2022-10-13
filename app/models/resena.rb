class Resena < ApplicationRecord
  belongs_to :turno
  belongs_to :user

  validates :valoracion,
            numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 1,
                            only_integer: true }
  validates :descripcion, length: { minimum: 5 }
end
