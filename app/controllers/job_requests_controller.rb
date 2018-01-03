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


  def destroy
    # Using current_user.job_requests prevents users from deleting others' data
    current_user.job_requests.destroy(params[:id].to_i)
    render json: { message: "Job request ##{params[:id]} has been deleted." }, status: 200
  end


  def index
    render json: { job_requests: current_user.job_requests }, status: 200
  end
  

  def show
    render json: { job_request: current_user.job_requests.find(params[:id]) }, status: 200
  end
    

  def update
    current_user.job_requests.update(params[:id], filtered_params)
    render json: { message: "Job request updated." }, status: 200
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
