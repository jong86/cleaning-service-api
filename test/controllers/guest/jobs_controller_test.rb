require 'test_helper'

class Guest::JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get billing" do
    get guest_jobs_billing_url
    assert_response :success
  end

end
