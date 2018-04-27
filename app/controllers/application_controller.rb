class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :add_default_params

  def add_default_params
    @per_page = params[:per_page].present? ? (params[:per_page].to_i) : 10
    @page = params[:page].present? ? params[:page] : 1
  end
end
