class Admin::BlogsController < ApplicationController
    before_action :authenticate_admin
    before_action :blog, only:[:edit,:update]
    layout "desk"
    
    def index
        @blogs = Blog.all.page(@page).per(@per_page)
    end

    def new
        @blog = Blog.new
    end

    def create
        blog = Blog.new(image:params[:blog][:image],title:params[:blog][:title],description:params[:blog][:description],topic_id:params[:blog][:topic_id],user_id:current_user.id)
        if blog.save
            redirect_to admin_blogs_path
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @blog.update(image:params[:blog][:image],title:params[:blog][:title],description:params[:blog][:description],topic_id:params[:blog][:topic_id])
            redirect_to admin_blogs_path
        else
            render 'edit'
        end
    end

    private
    
    def blog_params
        params.require(:blog).permit(:image, :title, :description,:topic_id)
    end

    def blog
        @blog = Blog.find(params[:id])
    end
end
