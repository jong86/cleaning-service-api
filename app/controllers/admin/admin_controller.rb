class Admin::AdminController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    unless current_user.type == "Admin"
      render json: { error: 'You are not authorized to access the admin portal' }, status: 401
    end
  end
end
