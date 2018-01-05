class Interview < ApplicationRecord
  belongs_to :job_request, class_name: "JobRequest", inverse_of: :interviews
end
