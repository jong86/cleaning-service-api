class User < ApplicationRecord
  has_many :job_requests, class_name: "JobRequest", foreign_key: "client_id"
  has_many :jobs, through: :job_requests
  has_many :jobs, class_name: "Job", foreign_key: "employee_id"
end
