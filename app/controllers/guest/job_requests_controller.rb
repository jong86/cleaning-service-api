class Guest::JobRequestsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    job_request = JobRequest.new(filtered_params)

    if job_request.save!
      ActionCable.server.broadcast 'admin',
        type: 'NEW_JOB_REQUEST',
        num_active_job_requests: JobRequest.where('is_active is true').count()

      render json: {
        message: "Job request created.",
        job_request: job_request,
      }, status: 200
    end
  end


  private

  def filtered_params
    params.permit(
      :address,
      :description,
      :guest_first_name,
      :guest_last_name,
      :guest_email,
    )
  end
end
