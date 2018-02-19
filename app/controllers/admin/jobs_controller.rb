class Admin::JobsController < Admin::AdminController
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

      require 'pony'
      Pony.mail({
        :to => 'jon_gaspar@hotmail.com',
        :via => :smtp,
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'vancleaningservicemailer',
          :password             => '66hAMzE$2MPp',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        },
        :from => 'railsapp@example.com',
        :subject => 'Hello From Rails',
      })


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
