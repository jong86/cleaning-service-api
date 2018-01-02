class ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
    render json: {
      user_data: @client,
      job_requests: @client.job_requests,
      jobs: @client.jobs,
    }, status: 200
  end
end
