# rails generate controller Welcome index
class WelcomeController < ApplicationController
  def index
  	render layout: "desk_page"
  end
end
