# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Messages', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      contenido: 'Example description',
      hora: 'Sat, 19 Nov 2011 18:54:13 UTC +00:00'
    }

    @invalid_attr_user = {
      contenido: '',
      hora: 'Sat, 19 Nov 2011 18:54:13 UTC +00:00'
    }
    @attr_user2 = {
      contenido: 'Example description 2',
      hora: 'Sat, 19 Nov 2011 18:54:13 UTC +00:00'
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful message' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/messages'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful message' do
      get '/messages/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful message' do
      # Se crea una instancia de Profile
      @message = Message.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/request/#{@message.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Mesages by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/messages', params: { message: @attr_user }
      end.to change(Message, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Messages' do
      expect do
        post '/messages', params: { message: @invalid_attr_user }
      end.to change(Message, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful message' do
      @message = Message.create!(@attr_user)
      get "/messages/#{@message.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Message' do
      # Se crea el perfil donde se testeará el update
      @message = Message.create!(@attr_user)

      expect do
        patch "/message/#{@message.id}",
              params: { message: { contenido: 'Este contenido es nuevo' } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @message.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@message, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Messages' do
      # Se crea el perfil donde se testeará el update
      @message = Message.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/message/#{@message.id}", params: { message: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @message.reload
      end.to_not change(@message, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Messages by 1' do
      # Se crea el perfil donde se testeará el update
      @message = Message.create!(@attr_user)
      expect do
        delete "/message/#{@message.id}"
      end.to change(Message, :count).by(-1)
    end
  end
end
