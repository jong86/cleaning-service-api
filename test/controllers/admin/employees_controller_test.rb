require 'test_helper'

class Admin::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin/jobs" do
    get admin_employees_admin/jobs_url
    assert_response :success
  end

  test "should get admin/job_requests" do
    get admin_employees_admin/job_requests_url
    assert_response :success
  end

end
