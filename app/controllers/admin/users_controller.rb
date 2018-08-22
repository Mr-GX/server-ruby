class Admin::UsersController < ApplicationController
    before_action :authenticate_admin
    before_action :find_object,only:[:edit,:update]
    layout "desk"

    def index
        @users = User.all.page(@page).per(@per_page)
    end

    def edit
        
    end

    def update
        if @user.update(nick_name:params[:user][:nick_name],mobile:params[:user][:mobile])
            redirect_to admin_users_path
        else
            render 'edit'
        end
    end

    private
    def find_object
        @user = User.find_by_id(params[:id])
    end
end
