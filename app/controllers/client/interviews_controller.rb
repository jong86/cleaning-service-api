class Client::InterviewsController < ApplicationController
  def index
    render json: {
      message: "Rendering current user's interviews",
      interviews: current_user.interviews,
    }, status: 200
  end
end
