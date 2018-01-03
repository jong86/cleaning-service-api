class Job < ApplicationRecord
  belongs_to :job_request, class_name: "JobRequest", inverse_of: :jobs
  belongs_to :employee, class_name: "Employee", inverse_of: :jobs
  delegate :client, :to => :job_request

  after_initialize :init

  def init
    self.is_paid ||= false
  end
end
