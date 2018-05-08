class Admin::HomesController < ApplicationController
  before_action :authenticate_admin
  layout "desk"
  def index
  end
end
