class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users=User.all
		render layout: "desk_page"
	end
	def show
		render layout: "desk_page"
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end
end
