require 'rails_helper'

RSpec.describe 'chats/show', type: :view do
  before(:each) do
    @chat = assign(:chat, Chat.create!(
                            turno: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
  end
end
