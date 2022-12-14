require 'rails_helper'

RSpec.describe 'messages/edit', type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
                                  contenido: 'MyText',
                                  chat: nil
                                ))
  end

  it 'renders the edit message form' do
    render

    assert_select 'form[action=?][method=?]', message_path(@message), 'post' do
      assert_select 'textarea[name=?]', 'message[contenido]'

      assert_select 'input[name=?]', 'message[chat_id]'
    end
  end
end
