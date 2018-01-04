class Admin::EmployeesController < ApplicationController
  def index
    render json: { message: Employee.all }, status: 200
  end
  
  def jobs
    Job.where("employee_id = ?", self.id)
  end

  def show
    @employee = Employee.find(params[:id])
    render json: {
      user_data: @employee,
      jobs: @employee.jobs,
    }, status: 200
  end
end
