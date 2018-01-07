class JobRequest < ApplicationRecord
  validates :address, presence: true
  validates :work_description, presence: true

  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
  has_many :interviews, class_name: "Interview", foreign_key: "job_request_id"

  def client
    if self.client_id
      User.find(self.client_id)
    end
  end
end
