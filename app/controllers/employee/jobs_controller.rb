class Employee::JobsController < ApplicationController
  def index
    render json: {
      message: "Rendering employee's list of jobs",
      jobs: current_user.jobs.order(:confirmed_time),
    }, status: 200
  end

  def show
    id = params[:id]
    render json: {
      message: "Rendering employee's job with id=#{id}",
      job: current_user.jobs.find(id),
    }, status: 200
  end

  def update
    id = params[:id]
    job = current_user.jobs.find(id)

    if job.update!(filtered_params)
      # Broadcast to subscribers if job is complete
      if job.time_work_completed
        ActionCable.server.broadcast 'admin',
          message: 'Employee finished job',
          job: job
      end

      render json: {
        message: "Updated employee's job with id=#{id}",
        job: current_user.jobs.find(id),
      }, status: 200
    end
  end


  private

  def filtered_params
    params.permit(
      :confirmed_time,
      :time_work_started,
      :time_work_completed,
      :employee_notes,
    )
  end
end
