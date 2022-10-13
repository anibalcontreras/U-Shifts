# frozen_string_literal: true

# require '../profile_helper.rb'
require 'rails_helper'

# Se agrupan todos los tests relacionados al controlador de Profiles,
# con esta línea se le dice a Rails que será testeado
RSpec.describe 'Users', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      name: 'Vicente Cruz',
      username: 'vinicruz',
      email: 'vini@cruz.gmail.com',
      age: 20,
      direccion: 'Sancarlosapoquindo 2344',
      phone: '956735687',
      password: 'holahola',
      image: 'https://i.pinimg.com/originals/63/39/2f/63392fa88244d183777fdb1018e4b602.jpg'
    }

    @invalid_attr_user = {
      name: '',
      username: 'v',
      email: 'vinicruzgmailcom',
      age: 'veinte',
      direccion: 'Sancarlosapoquindo 2344',
      phone: '956735687',
      password: 'holahola',
      image: 'https://i.pinimg.com/originals/63/39/2f/63392fa88244d183777fdb1018e4b602.jpg'
    }

    @attr_user2 = {
      name: 'Vicente Cruz2',
      username: 'vcrb',
      email: 'vini@cruz.gmail.com2',
      age: 20,
      direccion: 'Sancarlosapoquindo 24442',
      phone: '956735687',
      password: 'holahola',
      image: 'https://i.pinimg.com/originals/63/39/2f/63392fa88244d183777fdb1018e4b602.jpg'
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful user' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/users'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful user' do
      get '/users/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful request' do
      # Se crea una instancia de Profile
      @user = User.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/user/#{@user.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Users by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/users', params: { user: @attr_user }
      end.to change(User, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Users' do
      expect do
        post '/users', params: { user: @invalid_attr_user }
      end.to change(User, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful user' do
      @user = User.create!(@attr_user)
      get "/users/#{@user.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a User' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)

      expect do
        patch "/user/#{@user.id}", params: { user: { age: 18 } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @user.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@user, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a User' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/user/#{@user.id}", params: { user: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @user.reload
      end.to_not change(@user, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Users by 1' do
      # Se crea el perfil donde se testeará el update
      @user = User.create!(@attr_user)
      expect do
        delete "/user/#{@user.id}"
      end.to change(User, :count).by(-1)
    end
  end
end
