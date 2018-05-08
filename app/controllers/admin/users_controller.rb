class Admin::UsersController < ApplicationController
    before_action :authenticate_admin
    layout "desk"

    def index
        @users = User.all.page(@page).per(@per_page)
    end
end
