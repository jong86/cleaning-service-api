class JobRequestsController < ApplicationController
  def show
    @job_request = JobRequest.find(params[:id])
    render json: {
      job_request_data: @job_request,
      client: @job_request.client,
    }, status: 200
  end
end
