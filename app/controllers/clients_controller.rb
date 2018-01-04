class ClientsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    client = Client.new(filtered_params)

    if client.save
      render json: {
        message: "New client created",
        client_data: client.attributes.except('type', 'password_digest', 'updated_at'),
      }, status: 200
    else
      render json: { errors: client.errors.messages }, status: 400
    end
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
    id = params[:id].to_i
    client = Client.find(id).assign_attributes(filtered_params)
    if client.save
      render json: { message: client }, status: 200
    else
      render json: { errors: client.errors.messages }, status: 400
    end
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
