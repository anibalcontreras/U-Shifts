# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe 'Messages', type: :request do
  # Se crean unos atributos para la creación de un Profile
  # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
  before(:each) do
    @attr_user = {
      username: 'anibal.contreras',
      turno_id: 1
    }

    @invalid_attr_user = {
      username: 'anibal.contreras',
      turno_id: 'aosdmaslkdnas'
    }
    @attr_user2 = {
      username: 'anibal.contreras2',
      turno_id: 2
    }
  end
  # Se describe lo que se testea
  describe 'get index' do
    # Comportamiento esperado
    it 'should return a successful member' do
      # Se le señala a Rails que se haga un GET a la ruta /profiles
      get '/members'
      # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_new' do
    it 'should return a successful member' do
      get '/members/new'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get_show' do
    it 'should return a successful member' do
      # Se crea una instancia de Profile
      @member = Member.create!(@attr_user)
      # Se realiza un GET con el id del profile recién creado y
      # se espra que la salida sea un 200 que es lo mismo que un ok
      get "/request/#{@member.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
    it 'should increase count of Members by 1' do
      # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
      expect do
        post '/members', params: { member: @attr_user }
      end.to change(Member, :count).by(1)
    end
    # No debería aumentar la cuenta porque
    # le estamos pasando un atributo inválido según las validaciones que se hicieron
    it 'should not increase count of Members' do
      expect do
        post '/members', params: { member: @invalid_attr_user }
      end.to change(Member, :count).by(0)
    end
  end

  describe 'edit' do
    it 'should return a successful member' do
      @member = Member.create!(@attr_user)
      get "/members/#{@member.id}/edit"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'update' do
    it 'should change a Member' do
      # Se crea el perfil donde se testeará el update
      @member = Member.create!(@attr_user)

      expect do
        patch "/member/#{@member.id}",
              params: { member: { username: 'Este username es nuevo' } }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        @member.reload
        # Luego se revisa si cambió alguno de los atributos del usuario
      end.to change(@member, :attributes)
    end
  end

  describe 'update' do
    it 'should not change a Members' do
      # Se crea el perfil donde se testeará el update
      @member = Member.create!(@attr_user)

      expect do
        # Se realiza un patch dado que es de actualización de un usuario ya creado
        patch "/member/#{@member.id}", params: { member: @invalid_attr_user }
        # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
        # Luego se revisa si cambió alguno de los atributos del usuario
        @member.reload
      end.to_not change(@member, :attributes)
    end
  end

  describe 'delete' do
    it 'should decrease count of Members by 1' do
      # Se crea el perfil donde se testeará el update
      @member = Member.create!(@attr_user)
      expect do
        delete "/member/#{@member.id}"
      end.to change(Member, :count).by(-1)
    end
  end
end
