require "test_helper"

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get measurements_destroy_url
    assert_response :success
  end
end
