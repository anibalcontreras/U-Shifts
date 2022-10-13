require 'rails_helper'

RSpec.describe 'members/new', type: :view do
  before(:each) do
    assign(:member, Member.new(
                      username: 'MyString',
                      turno_id: 1
                    ))
  end

  it 'renders new member form' do
    render

    assert_select 'form[action=?][method=?]', members_path, 'post' do
      assert_select 'input[name=?]', 'member[username]'

      assert_select 'input[name=?]', 'member[turno_id]'
    end
  end
end
