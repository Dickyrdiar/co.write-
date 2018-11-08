require 'test_helper'

class AllTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_tags_index_url
    assert_response :success
  end

  test "should get show" do
    get all_tags_show_url
    assert_response :success
  end

end
