class Client::JobRequestsController < ApplicationController
  def create
    job_request = JobRequest.create!(filtered_params.merge({:client_id => current_user[:id]}))
    render json: {
      message: "Job request created.",
      job_request: current_user.job_requests.find(job_request[:id]),
    }, status: 200
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
    job_request = current_user.job_requests.find(params[:id])

    job_request.update!(filtered_params)
    render json: {
      message: "Client's job request updated",
      job_request: job_request,
    }, status: 200
  end

  private

  def filtered_params
    params.permit(
      :address,
      :possible_times,
      :description,
      :quantity_hours,
      :interview_requested,
      :possible_interview_times,
      :interview_notes,
    )
  end
end
