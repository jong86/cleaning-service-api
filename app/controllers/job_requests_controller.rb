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
    client_id_of_job_request = JobRequest.find(params[:id]).client_id
    
    if current_user[:id].to_i == client_id_of_job_request.to_i
      JobRequest.delete(params[:id])
      render json: { message: "Job request ##{params[:id]} has been deleted." }, status: 200
    else
      render json: { message: "You are not allowed to delete other people's data." }, status: 403
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
    client_id_of_job_request = JobRequest.find(params[:id]).client_id

    if current_user[:id].to_i == client_id_of_job_request.to_i
      job_request = JobRequest.find(params[:id])
      render json: {
        job_request: job_request,
        }, status: 200
    else
      render json: { message: "Users can only view their own information." }, status: 403
    end
  end
    

  def update
    client_id_of_job_request = JobRequest.find(params[:id]).client_id

    if current_user[:id].to_i == client_id_of_job_request.to_i
      JobRequest.update(params[:id], filtered_params)
      render json: { message: "Job request updated." }, status: 200
    else
      render json: { message: "You cannot update another user's data." }, status: 403
    end
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
