class Admin::JobsController < Admin::AdminController
  include MailHelper

  def create
    job = Job.new(filtered_params)

    if job.save!
      # Broadcast to subscribers
      ActionCable.server.broadcast 'employees',
        job: job

      render json: {
        message: "New job created",
        job: job,
      }
    end
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

    render json: {
      total_rows: Job.count,
      jobs: Job.select(
        :id,
        :bill_sent,
        :is_paid,
        :created_at,
        :confirmed_time,
        :time_work_started,
        :time_work_completed,
      )
      .limit(num_per_page)
      .offset(page * num_per_page)
      .order(:confirmed_time)
    }, status: 200
  end

  def show
    job = Job.find(params[:id])
    render json: {
      job: job,
    }, status: 200
  end

  def update
    id = params[:id]
    job = Job.find(id)
    if job.update!(filtered_params)

      if job.bill_sent
        # If it is being indicated that bill is sent
        send_bill_in_mail('vancleaningtestmailer@gmail.com', job.uuid)

        # TO DO: if error with sending bill, change bill_sent to false
      end

      # Render response
      render json: {
        message: "Job data updated",
        job_data: job.attributes
      }, status: 200
    end
  end


  private

  def filtered_params
    params.permit(
      :employee_id,
      :confirmed_time,
      :admin_notes,
      :address,
      :description,
      :phone,
      :email,
      :bill_sent,
      :bill_amount,
      :customer_first_name,
      :customer_last_name,
    )
  end
end
