require 'test_helper'

class Employees::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employees_employees_index_url
    assert_response :success
  end

end
