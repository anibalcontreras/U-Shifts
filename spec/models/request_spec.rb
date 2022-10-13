# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request, type: :model do
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:request) { create(:request) }
  let(:second_request) { create(:request) }

  it 'is not valid without description' do
    request.descripcion = nil
    expect(request).not_to be_valid
  end

  it 'is not valid with a description too short' do
    request.descripcion = 'asd'
    expect(request).not_to be_valid
  end

  describe 'summary' do
    it 'contains the descripción' do
      expect(request.summary).to eq(request.descripcion.to_s)
    end
  end
end
