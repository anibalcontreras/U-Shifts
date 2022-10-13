require 'rails_helper'

RSpec.describe 'members/edit', type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
                                username: 'MyString',
                                turno_id: 1
                              ))
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(@member), 'post' do
      assert_select 'input[name=?]', 'member[username]'

      assert_select 'input[name=?]', 'member[turno_id]'
    end
  end
end
