# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Turnos', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      resenador: 'Vicente Cruz',
      resenado: 'Anibal Contreras',
      valoracion: 10,
      descripcion: 'Example description'
    }

    @invalid_attr_user = {
      resenador: 'Vicente Cruz',
      resenado: 'Anibal Contreras',
      valoracion: 12,
      descripcion: 'Example description'
    }
    @attr_user2 = {
      resenador: 'Vicente Cruz',
      resenado: 'Pedro',
      valoracion: 5,
      descripcion: 'Example description 2'
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful request' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/resenas'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful request' do
      get '/resenas/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      # Se crea una instancia de Profile
      @resena = Resena.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/resena/#{@turno.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Reseñas by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/resenas', params: { resena: @attr_user }
      end.to change(Resena, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Reseñas' do
      expect do
        post '/resenas', params: { resena: @invalid_attr_user }
      end.to change(Resena, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful request' do
      @resena = Resena.create!(@attr_user)
      get "/resenas/#{@resena.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Reseña' do
      # Se crea el perfil donde se testeará el update
      @resena = Resena.create!(@attr_user)

      expect do
        patch "/resena/#{@resena.id}", params: { resena: { valoracion: 3 } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @resena.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@resena, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Reseñas' do
      # Se crea el perfil donde se testeará el update
      @resena = Resena.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/resena/#{@resena.id}", params: { resena: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @resena.reload
      end.to_not change(@resena, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Reseñas by 1' do
      # Se crea el perfil donde se testeará el update
      @resena = Resena.create!(@attr_user)
      expect do
        delete "/resena/#{@resena.id}"
      end.to change(Resena, :count).by(-1)
    end
  end
end
