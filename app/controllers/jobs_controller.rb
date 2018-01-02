class JobsController < ApplicationController
  def index
    @jobs = Employee.find(1).jobs
    render json: @jobs
  end
end
