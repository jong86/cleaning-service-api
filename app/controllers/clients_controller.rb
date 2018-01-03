class ClientsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    render json: { message: "create path for client" }, status: 200
  end


  def show
    @client = Client.find(params[:id])
    render json: {
      user_data: @client,
      job_requests: @client.job_requests,
      jobs: @client.jobs,
    }, status: 200
  end
end
