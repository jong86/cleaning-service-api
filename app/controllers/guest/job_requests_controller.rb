class Guest::JobRequestsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    job_request = JobRequest.create!(filtered_params)
    render json: {
      message: "Job request created.",
      job_request: job_request,
    }, status: 200
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
