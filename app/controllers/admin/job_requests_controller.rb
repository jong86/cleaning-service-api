class Admin::JobRequestsController < Admin::AdminController
  def destroy
    JobRequest.destroy(params[:id])
    render json: {
      message: "Job request ##{params[:id]} has been deleted"
    }, status: 200
  end

  def index
    render json: {
      message: "Rendering list of all job requests",
      job_requests: JobRequest.all,
    }, status: 200
  end

  def show
    render json: {
      message: "Rendering specified job request",
      job_requests: JobRequest.find(params[:id]),
    }, status: 200
  end

  def update
    job_request = JobRequest.find(params[:id])

    job_request.update!(filtered_params)
    render json: {
      message: "Job request updated",
      job_request: job_request,
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
