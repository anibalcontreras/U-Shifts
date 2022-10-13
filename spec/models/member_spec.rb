require 'rails_helper'

RSpec.describe Member, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:member) { create(:member) }
  let(:second_member) { create(:member) }

  it 'is valid with valid attributes' do
    expect(member).to be_valid
  end
  # validates :age, numericality: { greater_than_or_equal_to: 0 }

  it 'is not valid without username' do
    user.username = nil
    expect(member).not_to be_valid
  end

  it 'is not valid with a username too short' do
    user.username = 'a'
    expect(member).not_to be_valid
  end

  it 'is not valid without turno id' do
    member.turno_id = nil
    expect(member).not_to be_valid
  end

  it 'is not valid with a string turno id' do
    member.turno_id = 'asd'
    expect(member).not_to be_valid
  end

  describe 'summary' do
    it 'contains the username, turno_id' do
      expect(member.summary).to eq("#{member.username} - #{member.turno_id}")
    end
  end
end
