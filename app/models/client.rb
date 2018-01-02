class Client < ApplicationRecord
  has_many :job_requests, class_name: "JobRequest", foreign_key: "client_id"
end
