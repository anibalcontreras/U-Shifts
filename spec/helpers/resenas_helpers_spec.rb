require 'rails_helper'
include TurnosHelper

RSpec.describe 'Resenas', type: :request do
  describe 'Resenas helper methods' do
    it 'should return true' do
      valoracion = 5
      valoracion_is_int(valoracion).should eq(true)
    end

    it 'should return true' do
      descripcion = 'Ejemplo de descripción'
      first_letter(descripcion).should eq(true)
    end
  end
end
