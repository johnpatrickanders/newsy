require "test_helper"

class OgImagerControllerTest < ActionDispatch::IntegrationTest
  test "should get dev_to" do
    get og_imager_dev_to_url
    assert_response :success
  end
end
