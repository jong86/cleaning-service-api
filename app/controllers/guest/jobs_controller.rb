class Guest::JobsController < ApplicationController
  skip_before_action :authenticate_request

  def show_bill
    uuid = params[:uuid]
    billing_info = Job.select('bill_amount, is_paid').where(['uuid = ?', uuid]).first

    render json: {
      message: "Showing bill #{uuid}",
      amount: billing_info.bill_amount,
      is_paid: billing_info.is_paid
    }, status: 200
  end


  def mark_bill_as_paid
    uuid = params[:uuid]
    job = Job.where(['uuid = ?', uuid]).first

    if job.update!(is_paid: true)
      render json: {
        message: "Bill marked as paid",
      }, status: 200
    end
  end
end
