class Guest::JobsController < ApplicationController
  skip_before_action :authenticate_request

  def show_bill
    uuid = params[:uuid]
    render json: {
      message: "showing bill #{uuid}",
    }, status: 200
  end

  def pay_bill
    uuid = params[:uuid]
    render json: {
      message: "paying bill #{uuid}",
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :is_paid
    )
  end
end
