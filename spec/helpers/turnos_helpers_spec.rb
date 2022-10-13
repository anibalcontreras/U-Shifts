require 'rails_helper'
include TurnosHelper

RSpec.describe 'Turnos', type: :request do
  describe 'Turnos helper methods' do
    it 'should return true' do
      limite_personas = 3
      limite_personas_is_int(limite_personas).should eq(true)
    end
  end
end
