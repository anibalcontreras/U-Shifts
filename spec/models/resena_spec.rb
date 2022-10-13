# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resena, type: :model do
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:resena) { create(:resena) }
  let(:second_resena) { create(:resena) }

  it 'is valid with valid attributes' do
    expect(resena).to be_valid
  end
  # validates :age, numericality: { greater_than_or_equal_to: 0 }

  it 'is not valid with an empty name' do
    resena.resenador = nil
    expect(resena).not_to be_valid
  end

  it 'is not valid with a name too short' do
    resena.resenador = 'a'
    expect(resena).not_to be_valid
  end

  it 'is not valid with an empty name' do
    resena.resenado = nil
    expect(resena).not_to be_valid
  end

  it 'is not valid with a name too short' do
    resena.resenado = 'a'
    expect(resena).not_to be_valid
  end

  it 'is not valid without description' do
    resena.descripcion = nil
    expect(resena).not_to be_valid
  end

  it 'is not valid with a description too short' do
    resena.descripcion = 'asd'
    expect(resena).not_to be_valid
  end

  it 'is not valid without valoracion' do
    resena.valoracion = nil
    expect(resena).not_to be_valid
  end

  it 'is not valid with a string valoración' do
    resena.valoracion = 'asd'
    expect(resena).not_to be_valid
  end

  it 'is not valid with a valoración too high' do
    resena.valoracion = 11
    except(resena).not_to be_valid
  end

  it 'is not valid with a negative valoración' do
    resena.valoracion = -1
    except(resena).not_to be_valid
  end

  describe 'summary' do
    it 'contains the reseñador, reseñado, valoración, descripción' do
      expect(resena.summary).to eq("#{resena.resenador} - #{resena.resenado} - #{resena.valoracion} - #{resena.descripcion}")
    end
  end
end
