class Admin::EmployeesController < ApplicationController
  def create
    employee = Employee.create!(filtered_params)
    render json: {
      message: "Employee created",
      employee: employee, 
    }, status: 200
  end
  
  def index
    render json: {
      message: "Rendering list of all employees",
      employees: Employee.all
    }, status: 200
  end

  def jobs
    # For returning a list of all of an employee's jobs
    # (maybe not needed with AR but couldn't get it to work normally)
    Job.where("employee_id = ?", self.id)
  end

  def show
    employee = Employee.find(params[:id])
    render json: {
      user_data: employee,
      jobs: employee.jobs,
    }, status: 200
  end

  def update
    id = params[:id]
    employee = Employee.find(id)
    employee.update!(filtered_params)
    render json: {
      message: "Employee data updated",
      employee_data: employee.attributes
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation,
      :phone_number,
      :address,
      :availability,
      :info,
    )
  end
end
