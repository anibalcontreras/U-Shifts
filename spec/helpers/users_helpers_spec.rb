require 'rails_helper'
include UsersHelper

RSpec.describe 'Users', type: :request do
  describe 'Users helper methods' do
    it 'should return true' do
      email = 'anibal@contreras.cl'
      arroba_in_email(email).should eq(true)
    end
  end
end
