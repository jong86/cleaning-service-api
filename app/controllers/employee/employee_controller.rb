class Employee::EmployeeController < ApplicationController
  def index
    render json: {
      message: "Rendering employee data",
      employee: current_user,
    }, status: 200
  end
end
