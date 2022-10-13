require 'rails_helper'

RSpec.describe 'members/index', type: :view do
  before(:each) do
    assign(:members, [
             Member.create!(
               username: 'Username',
               turno_id: 2
             ),
             Member.create!(
               username: 'Username',
               turno_id: 2
             )
           ])
  end

  it 'renders a list of members' do
    render
    assert_select 'tr>td', text: 'Username'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
