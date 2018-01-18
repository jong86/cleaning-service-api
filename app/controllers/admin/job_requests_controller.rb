class Admin::JobRequestsController < Admin::AdminController
  def destroy
    JobRequest.destroy(params[:id])
    render json: {
      message: "Job request ##{params[:id]} has been deleted"
    }, status: 200
  end

  def index
    page = params[:p].to_i - 1
    num_per_page = params[:npp].to_i

    puts page, num_per_page

    render json: {
      message: "Returning page #{page}, num per page: #{num_per_page}",
      total_num: JobRequest.count,
      job_requests: JobRequest.limit(num_per_page).offset(page * num_per_page).order(:created_at).reverse_order,
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
