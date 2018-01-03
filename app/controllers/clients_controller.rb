class ClientsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    if params[:email] == params[:email_confirmation]
      render json: { message: "Creating a new client with this info: #{filtered_params}" }, status: 200
      Client.create(filtered_params)
    else
      render json: { message: "Email and email confirmation don't match." }, status: 400
    end
  end


  def show
    @client = Client.find(params[:id])
    render json: {
      user_data: @client,
      job_requests: @client.job_requests,
      jobs: @client.jobs,
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :phone_number,
      :address,
      :info,
    )
  end
end
