class JobRequestsController < ApplicationController
  def create
    job_request = JobRequest.new(filtered_params)
    if job_request.valid?
      job_request.save
      render json: { message: "Job request created." }, status: 200
    else
      render json: { errors: job_request.errors.messages }, status: 400
    end
  end

  def index
    if current_user[:id].to_i == params[:client_id].to_i
      render json: { job_requests: User.find(params[:client_id]).job_requests }, status: 200
    else
      render json: { message: "Users can only view their own information." }, status: 403
    end
  end
  
  def show
    @job_request = JobRequest.find(params[:id])
    render json: {
      job_request_data: @job_request,
      client: @job_request.client,
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :client_id,
      :address,
      :possible_times,
      :work_description,
      :quantity_hours,
      :interview_requested,
      :possible_interview_times,
      :interview_notes,
    )
  end
end
