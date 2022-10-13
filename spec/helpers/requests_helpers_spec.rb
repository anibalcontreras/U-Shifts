require 'rails_helper'
include RequestsHelper

RSpec.describe 'Requests', type: :request do
  describe 'Requests helper methods' do
    it 'should return true' do
      descripcion = 'Ejemplo de descripción'
      first_letter(descripcion).should eq(true)
    end
  end
end
