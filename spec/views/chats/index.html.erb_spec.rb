require 'rails_helper'

RSpec.describe 'chats/index', type: :view do
  before(:each) do
    assign(:chats, [
             Chat.create!(
               turno: nil
             ),
             Chat.create!(
               turno: nil
             )
           ])
  end

  it 'renders a list of chats' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
