# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Turno, type: :model do
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:turno) { create(:turno) }
  let(:second_turno) { create(:turno) }

  it 'is valid with valid attributes' do
    expect(turno).to be_valid
  end
  # validates :age, numericality: { greater_than_or_equal_to: 0 }

  it 'is not valid without nombre completo' do
    turno.nombre_completo = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a nombre completo too short' do
    turno.nombre_completo = 'a'
    expect(turno).not_to be_valid
  end

  it 'is not valid without description' do
    turno.descripcion = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a description too short' do
    turno.descripcion = 'asd'
    expect(turno).not_to be_valid
  end

  it 'is not valid without comuna' do
    turno.comuna = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a comuna too short' do
    turno.comuna = 'a'
    expect(turno).not_to be_valid
  end

  it 'is not valid without direccion_salida' do
    turno.direccion_salida = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a direccion_salida too short' do
    turno.direccion_salida = 'a'
    expect(turno).not_to be_valid
  end

  it 'is not valid without número de pasajeros' do
    turno.limite_personas = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a string número de pasajeros' do
    turno.limite_personas = 'asd'
    expect(turno).not_to be_valid
  end

  it 'is not valid without direccion_salida' do
    turno.direccion_salida = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with a direccion_salida too short' do
    turno.direccion_salida = 'a'
    expect(turno).not_to be_valid
  end

  it 'is not valid with a direccion too short' do
    turno.direccion = 'asd'
    expect(turno).not_to be_valid
  end

  it 'is not valid without a direccion' do
    turno.direccion = nil
    expect(turno).not_to be_valid
  end

  it 'is not valid with an empty tipo' do
    turno.tipo = nil
    expect(turno).not_to be_valid
  end

  it 'is not validad with a tipo too short' do
    turno.tipo = 'as'
    except(turno).not_to be_valid
  end

  describe 'summary' do
    it 'contains the nombre completo, dirección de salida, comuna, límite de personas, dirección, descripción, hora_salida, día semana y tipo' do
      expect(turno.summary).to eq("#{turno.nombre_completo} - #{turno.comuna} - #{turno.direccion_salida} - #{turno.dia_semana} - #{turno.hora_salida} - #{turno.limite_personas} - #{turno.direccion} - #{turno.descripcion} - #{turno.tipo}")
    end
  end
end
