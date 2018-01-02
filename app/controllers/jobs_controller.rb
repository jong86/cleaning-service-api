class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    render json: {
      job_data: @job,
      client: @job.client,
      employee: @job.employee,
    }, status: 200
  end
end
