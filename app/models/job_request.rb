class JobRequest < ApplicationRecord
  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
end
