class JobRequestsController < ApplicationController
  def show
    @job_request = JobRequest.find(params[:id])
    render json: {
      job_request_data: @job_request,
      client: @job_request.client,
    }, status: 200
  end

  def index
    if current_user[:id].to_i == params[:client_id].to_i
      render json: { job_requests: User.find(params[:client_id]).job_requests }, status: 200
    else
      render json: { message: "Users can only view their own information." }, status: 403
    end
  end
end
