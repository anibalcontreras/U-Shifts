require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:message) { create(:message) }
  let(:second_message) { create(:message) }

  it 'is not valid without description' do
    message.contenido = nil
    expect(message).not_to be_valid
  end

  describe 'summary' do
    it 'contains the contenido, hora' do
      expect(message.summary).to eq("#{message.contenido} - #{message.hora}")
    end
  end
end
