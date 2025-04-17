require "test_helper"

class CompletionsControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle" do
    get completions_toggle_url
    assert_response :success
  end
end
