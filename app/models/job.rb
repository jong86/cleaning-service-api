class Job < ApplicationRecord
  belongs_to :employee, class_name: "Employee", inverse_of: :jobs
end
