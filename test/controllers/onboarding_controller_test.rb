require "test_helper"

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get onboarding_show_url
    assert_response :success
  end
end
