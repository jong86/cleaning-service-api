class Client < User
  include ActiveModel::AttributeAssignment

  has_many :job_requests, class_name: "JobRequest", foreign_key: "client_id"
  has_many :jobs, through: :job_requests
end
