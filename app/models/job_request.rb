class JobRequest < ApplicationRecord
  def client
    User.find(self.client_id)
  end

  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
  belongs_to :client, class_name: "Client", inverse_of: :jobs
end
