class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!
	def index
        @users=User.all
    end
    def show
		if User.exists?(params[:id])
			render json: {
                 status: {
                     code: 1,
                     msg: '成功'
                 },
                 data: User.find(params[:id])
             }
         else
			render json: {
                 status: {
                     code: 0,
                     msg:  '失败'
                 },
                 data: nil
             }
         end
	end
    def destroy
        @user=User.find(params[:id])
        @user.destroy

        redirect_to api_v1_users_path
    end
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        if @user.save
            redirect_to api_v1_users_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:email,:mobile,:admin,:activated)
    end
end
