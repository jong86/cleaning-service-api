class JobRequest < ApplicationRecord
  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
  belongs_to :client, class_name: "Client", inverse_of: :job_requests
end
