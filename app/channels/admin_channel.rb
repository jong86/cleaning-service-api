class AdminChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'admin'

    # Count how many jobs need to be billed, to show in dashboard
    num_jobs_ready_to_bill = Job.where('
      time_work_completed is not null and
      time_work_started is not null and
      is_paid is false
    ').count()

    # Broadcast message
    ActionCable.server.broadcast 'admin',
      type: 'initial',
      num_jobs_ready_to_bill: num_jobs_ready_to_bill,
      num_active_job_requests: JobRequest.where('is_active is true').count()
  end
end
