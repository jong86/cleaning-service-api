class Admin::JobsController < Admin::AdminController
  def create
    job = Job.create!(filtered_params)
    render json: {
      message: "New job created",
      job: job,
    }
  end

  def destroy
    Job.destroy(params[:id])
    render json: {
      message: "Job deleted",
    }, status: 200
  end

  def index
    render json: {
      message: "Rendering list of all jobs",
      jobs: Job.all,
    }, status: 200
  end

  def show
    job = Job.find(params[:id])
    render json: {
      job_data: job,
      client: job.client,
      employee: job.employee,
    }, status: 200
  end

  def update
    id = params[:id]
    job = Job.find(id)
    job.update!(filtered_params)
    render json: {
      message: "Job data updated",
      job_data: job.attributes
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :job_request_id,
      :employee_id,
      :confirmed_time,
      :admin_notes,
    )
  end
end
