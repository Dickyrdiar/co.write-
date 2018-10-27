require 'test_helper'

class Category::InternetControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get category_internet_show_url
    assert_response :success
  end

end
