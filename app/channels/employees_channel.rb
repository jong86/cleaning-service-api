class EmployeesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'employees'
  end
end
