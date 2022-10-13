# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  # validates :age, numericality: { greater_than_or_equal_to: 0 }

  it 'is not valid without a User name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a User name too short' do
    user.name = 'a'
    expect(user).not_to be_valid
  end

  it 'is not valid without username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a username too short' do
    user.username = 'a'
    expect(user).not_to be_valid
  end

  it 'is not valid without dirección' do
    user.direccion = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a direccion too short' do
    user.direccion = 'as'
    expect(user).not_to be_valid
  end

  it 'is not valid with a empty email' do
    user.email = nil
    except(user).not_to be_valid
  end

  it 'is not valid with a empty phone' do
    user.phone = nil
    except(user).not_to be_valid
  end

  it 'is not valid with a phone too short' do
    user.phone = '9456'
    expect(user).not_to be_valid
  end

  it 'is not valid with a empty password' do
    user.password = nil
    except(user).not_to be_valid
  end

  it 'is not valid with a password too short' do
    user.password = 'sdd'
    except(user).not_to be_valid
  end

  it 'is not valid with an empty username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a username too short' do
    user.username = 'd'
    except(user).not_to be_valid
  end

  describe 'summary' do
    it 'contains the name, email, age, dirección, phone, password, image' do
      expect(user.name).to eq("#{user.email} - #{user.age} - #{user.direccion} - #{user.phone} - #{user.password} - #{user.image} - #{user.username}")
    end
  end
end
