class Admin::ClientsController < Admin::AdminController
  def destroy
    Client.destroy(params[:id])
    render json: {
      message: "Client user deleted",
    }, status: 200
  end

  def index
    render json: {
      message: "Rendering list of all clients",
      clients: Client.all,
    }, status: 200
  end

  def show
    id = params[:id]
    client = Client.find(id)
    render json: {
      client_data: client.attributes.except('type', 'password_digest'),
      job_requests: client.job_requests,
      jobs: client.jobs,
    }, status: 200
  end

  def update
    id = params[:id]
    client = Client.find(id)
    client.update!(filtered_params)
    render json: {
      message: "Client data updated",
      client_data: client.attributes.except('type', 'password_digest')
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
