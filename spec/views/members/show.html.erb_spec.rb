require 'rails_helper'

RSpec.describe 'members/show', type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
                                username: 'Username',
                                turno_id: 2
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/2/)
  end
end
