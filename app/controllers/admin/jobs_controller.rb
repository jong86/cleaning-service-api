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
    page = params[:p].to_i - 1
    num_per_page = params[:npp].to_i

    puts page, num_per_page

    render json: {
      total_rows: Job.count,
      jobs: Job.joins(:job_request)
        .select(
          :id,
          :is_paid,
          :'job_requests.work_description',
          :'job_requests.address',
          :created_at,
        )
        .limit(num_per_page)
        .offset(page * num_per_page)
        .order(:created_at)
        .reverse_order
    }, status: 200
  end

  def show
    job = Job.find(params[:id])
    render json: {
      job: job,
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
