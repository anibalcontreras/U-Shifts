require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
                                  contenido: 'MyText',
                                  chat: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
