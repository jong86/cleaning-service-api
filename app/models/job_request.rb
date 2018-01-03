class JobRequest < ApplicationRecord
  validates :client_id, presence: true
  validates :address, presence: true
  validates :possible_times, presence: true
  validates :work_description, presence: true
  validates :quantity_hours, presence: true

  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
  belongs_to :client, class_name: "Client", inverse_of: :jobs

  def client
    User.find(self.client_id)
  end
end
