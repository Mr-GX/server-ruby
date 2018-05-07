class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :add_default_params

  def add_default_params
    @per_page = params[:per_page].present? ? (params[:per_page].to_i) : 10
    @page = params[:page].present? ? params[:page] : 1
  end

  def authenticate_user!
    session[:return_to] = request.url
    super
  end
  
  def authenticate_admin
    # current_user.user_type == USER_TYPE_SUPER
    unless user_signed_in?
      render "admin/homes/index"
    end
  end
end
