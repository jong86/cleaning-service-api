class Employee < User
  has_many :jobs, class_name: "Job", foreign_key: "employee_id"
end
