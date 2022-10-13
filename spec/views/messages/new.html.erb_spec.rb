require 'rails_helper'

RSpec.describe 'messages/new', type: :view do
  before(:each) do
    assign(:message, Message.new(
                       contenido: 'MyText',
                       chat: nil
                     ))
  end

  it 'renders new message form' do
    render

    assert_select 'form[action=?][method=?]', messages_path, 'post' do
      assert_select 'textarea[name=?]', 'message[contenido]'

      assert_select 'input[name=?]', 'message[chat_id]'
    end
  end
end
