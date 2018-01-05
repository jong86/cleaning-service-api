require 'test_helper'

class Employees::JobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employees_jobs_index_url
    assert_response :success
  end

  test "should get show" do
    get employees_jobs_show_url
    assert_response :success
  end

  test "should get update" do
    get employees_jobs_update_url
    assert_response :success
  end

end
