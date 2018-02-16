class AdminChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'admin'
  end
end
