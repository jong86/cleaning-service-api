class Client::ClientController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    client = Client.create!(filtered_params)
    render json: {
      message: "New client created",
      client_data: client.attributes.except('type', 'password_digest', 'updated_at'),
    }, status: 200
  end

  def destroy
    Client.destroy(current_user[:id])
    render json: {
      message: "Client user deleted",
    }, status: 200
  end

  def show
    render json: {
      client_data: current_user.attributes.except('type', 'password_digest', 'updated_at'),
      job_requests: current_user.job_requests,
      jobs: current_user.jobs.select(
        'id',
        'confirmed_time',
        'time_work_started',
        'time_work_completed',
        'is_paid',
      )
    }, status: 200
  end

  def update
    id = current_user.id
    client = Client.find(id)
    client.update!(filtered_params)
    render json: {
      message: "Client data updated",
      client_data: client.attributes.except('type', 'password_digest', 'updated_at')
    }, status: 200
  end

  private

  def filtered_params
    params.permit(
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation,
      :phone_number,
      :address,
      :info,
    )
  end
end
