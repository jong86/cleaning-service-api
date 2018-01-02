class Job < ApplicationRecord
  belongs_to :job_request, class_name: "JobRequest", inverse_of: :jobs
  belongs_to :employee
  delegate :client, :to => :job_request
end
