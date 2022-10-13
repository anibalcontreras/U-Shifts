# frozen_string_literal: true

# require '../profile_helper.rb'
require 'rails_helper'

# Se agrupan todos los tests relacionados al controlador de Profiles,
# con esta línea se le dice a Rails que será testeado
RSpec.describe 'Turnos', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_turno = {
      nombre_completo: 'Vicente Cruz',
      comuna: 'Las Condes',
      direccion_salida: 'San Carlos de Apoquindo 2880',
      dia_semana: Date.parse('2022-05-05'),
      hora_salida: Time.now,
      limite_personas: 5,
      direccion: 'San Joaquín',
      descripcion: 'Cobro 1500 por ida y vuelta',
      tipo: 'ida'
    }

    @invalid_attr_turno = {
      nombre_completo: 'Vicente Cruz',
      comuna: 'Las Condes',
      direccion_salida: 'San Carlos de Apoquindo 2880',
      dia_semana: Date.parse('2022-05-05'),
      hora_salida: Time.now,
      limite_personas: 'mil',
      direccion: 'San Joaquín',
      descripcion: 'Cobro 1500 por ida y vuelta',
      tipo: 'vueltaaaa'
    }
    @attr_turno2 = {
      nombre_completo: 'Vicente Cruz2',
      comuna: 'Las Condes2',
      direccion_salida: 'San Carlos de Apoquindo 28802',
      dia_semana: Date.parse('2022-04-05'),
      hora_salida: Time.now,
      limite_personas: 3,
      direccion: 'San Joaquín2',
      descripcion: 'Cobro 1500 por ida y vuelta2',
      tipo: 'vuelta'
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful request' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/turnos'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful request' do
      get '/turnos/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      # Se crea una instancia de Profile
      @turno = Turno.create!(@attr_turno)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/turno/#{@turno.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Turnos by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/turnos', params: { turno: @attr_turno }
      end.to change(Turno, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Turno' do
      expect do
        post '/turnos', params: { turno: @invalid_attr_turno }
      end.to change(Turno, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful request' do
      @turno = Turno.create!(@attr_turno)
      get "/turnos/#{@turno.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Turno' do
      # Se crea el perfil donde se testeará el update
      @turno = Turno.create!(@attr_turno)

      expect do
        patch "/turno/#{@turno.id}", params: { turno: { limite_personas: 4 } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @turno.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@turno, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Turno' do
      # Se crea el perfil donde se testeará el update
      @turno = Turno.create!(@attr_turno)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/turno/#{@turno.id}", params: { turno: @invalid_attr_turno }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @turno.reload
      end.to_not change(@turno, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Turno by 1' do
      # Se crea el perfil donde se testeará el update
      @turno = Turno.create!(@attr_turno)
      expect do
        delete "/turno/#{@turno.id}"
      end.to change(Turno, :count).by(-1)
    end
  end
end
