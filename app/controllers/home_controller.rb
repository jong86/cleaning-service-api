class HomeController < ApplicationController
  skip_before_action :authenticate_request

  def index
    render json: { message: "This is the home page" }, status: 200
  end
end
