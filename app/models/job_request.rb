class JobRequest < ApplicationRecord
  validates :address, presence: true
  validates :description, presence: true
  validates :guest_preferred_contact, inclusion: {
    in: %w(email phone),
    message: "is invalid. Preferred contact can only be 'email' or 'phone'"
  }, allow_nil: true

  belongs_to :client
  has_many :jobs, class_name: "Job", foreign_key: "job_request_id"
  has_many :interviews, class_name: "Interview", foreign_key: "job_request_id"
end
