require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get single" do
    get microposts_single_url
    assert_response :success
  end

end
