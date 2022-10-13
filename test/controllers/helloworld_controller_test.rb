require 'test_helper'

class HelloworldControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get helloworld_show_url
    assert_response :success
  end
end
