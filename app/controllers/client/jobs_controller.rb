class Client::JobsController < ApplicationController
  def index
    render json: {
      message: "Rendering list of all current client's jobs",
      jobs: current_user.jobs,
    }, status: 200
  end

  def show
    render json: {
      message: "Rendering requested job data",
      jobs: current_user.jobs.find(params[:id]),
    }, status: 200
  end
end
