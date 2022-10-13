# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Requests', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      descripcion: 'Example description'
    }

    @invalid_attr_user = {
      descripcion: 'asd'
    }
    @attr_user2 = {
      descripcion: 'Example description 2'
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful request' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/requests'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful request' do
      get '/requests/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      # Se crea una instancia de Profile
      @resena = Request.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/request/#{@request.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Requests by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/requests', params: { request: @attr_user }
      end.to change(Request, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Requests' do
      expect do
        post '/requests', params: { request: @invalid_attr_user }
      end.to change(Request, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful request' do
      @request = Request.create!(@attr_user)
      get "/requests/#{@request.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Request' do
      # Se crea el perfil donde se testeará el update
      @request = Request.create!(@attr_user)

      expect do
        patch "/request/#{@request.id}",
              params: { request: { descripcion: 'Esta descripción es nueva' } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @request.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@request, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Requests' do
      # Se crea el perfil donde se testeará el update
      @request = Request.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/request/#{@request.id}", params: { request: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @request.reload
      end.to_not change(@request, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Requests by 1' do
      # Se crea el perfil donde se testeará el update
      @request = Request.create!(@attr_user)
      expect do
        delete "/request/#{@request.id}"
      end.to change(Request, :count).by(-1)
    end
  end
end
