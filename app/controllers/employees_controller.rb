class EmployeesController < ApplicationController
  def jobs
    Job.where("employee_id = ?", self.id)
  end
end
