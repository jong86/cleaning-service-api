class JobsController < ApplicationController
  def show
    render json: { data: Job.find(params[:id]) }, status: 200
  end
end
