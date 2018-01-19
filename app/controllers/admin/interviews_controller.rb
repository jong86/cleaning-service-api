class Admin::InterviewsController < Admin::AdminController
  def create
    interview = Interview.create!(filtered_params)
    render json: {
      message: "Interview created",
      interview: interview,
    }, status: 200
  end

  def destroy
    id = params[:id]
    Interview.destroy(id)
    render json: {
      message: "Specified interview was deleted",
    }, status: 200
  end

  def index
    render json: {
      interviews: Interview.all,
    }, status: 200
  end

  def show
    id = params[:id]
    interview = Interview.find(id)
    render json: {
      interview: interview,
    }, status: 200
  end

  def update
    id = params[:id]
    interview = Interview.find(id)
    interview.update!(filtered_params)
    render json: {
      message: "Updated specified interview",
      interview: interview,
    }, status: 200
  end


  private

  def filtered_params
    params.permit(
      :job_request_id,
      :time,
      :address,
      :notes,
    )
  end
end
