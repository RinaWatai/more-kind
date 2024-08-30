require "test_helper"

class Member::MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_maps_show_url
    assert_response :success
  end
end
