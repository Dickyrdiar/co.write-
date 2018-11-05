require 'test_helper'

class CaetgoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get caetgory_index_url
    assert_response :success
  end

end
