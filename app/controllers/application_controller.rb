class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :add_default_params
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404

  def add_default_params
    @per_page = params[:per_page].present? ? (params[:per_page].to_i) : 10
    @page = params[:page].present? ? params[:page] : 1
  end

  def authenticate_user!
    session[:return_to] = request.url
    super
  end
  
  def authenticate_admin
    unless user_signed_in? && current_user.user_type == USER_TYPE_ADMIN
      redirect_to root_path
    end
  end

  private
  def render_404(exception = nil)
    if exception
        logger.info "Rendering 404: #{exception.message}"
    end
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
