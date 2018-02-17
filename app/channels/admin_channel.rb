class AdminChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'admin'

    # Count how many jobs need to be billed, to show in dashboard
    numJobsReadyToBill = Job.where('
      time_work_completed is not null and
      time_work_started is not null and
      is_paid is false
    ').count()

    ActionCable.server.broadcast 'admin',
      type: 'initial',
      numJobsReadyToBill: numJobsReadyToBill
  end
end
