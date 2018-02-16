class Job < ApplicationRecord
  belongs_to :employee, class_name: "Employee", inverse_of: :jobs

  after_initialize :init

  def init
    self.is_paid ||= false
  end
end
