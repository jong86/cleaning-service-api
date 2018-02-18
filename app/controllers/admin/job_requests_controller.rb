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
      total_rows: JobRequest.count,
      job_requests: JobRequest.limit(num_per_page)
        .select(
          :id,
          :address,
          :guest_first_name,
          :guest_last_name,
          :created_at,
          :is_active,
        )
        .offset(page * num_per_page)
        .order(:created_at)
        .reverse_order
    }, status: 200
  end

  def show
    render json: {
      job_request: JobRequest.find(params[:id]),
    }, status: 200
  end

  def update
    job_request = JobRequest.find(params[:id])

    if job_request.update!(filtered_params)
      # Broadcast message
      ActionCable.server.broadcast 'admin',
        type: 'JOB_REQUEST_MADE_INACTIVE',
        num_active_job_requests: JobRequest.where('is_active is true').count()

      render json: {
        job_request: job_request,
      }, status: 200
    end
  end

  private

  def filtered_params
    params.permit(
      :client_id,
      :address,
      :possible_times,
      :description,
      :quantity_hours,
      :interview_requested,
      :possible_interview_times,
      :interview_notes,
      :is_active,
    )
  end
end
