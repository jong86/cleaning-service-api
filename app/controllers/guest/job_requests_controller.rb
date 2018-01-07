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
      :possible_times,
      :work_description,
      :quantity_hours,
      :interview_requested,
      :possible_interview_times,
      :interview_notes,
      :guest_first_name,
      :guest_last_name,
      :guest_phone_number,
      :guest_email,
    )
  end
end
