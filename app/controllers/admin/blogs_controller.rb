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

    def upload_image
        uploaded_io = params[:upload_file]
        dir = Rails.root.join('public', 'uploads', "images")
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(dir.join(uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
        render json: { :success=> true ,:file_path=> dir+uploaded_io.original_filename}
    end

    private
    
    def blog_params
        params.require(:blog).permit(:image, :title, :description,:topic_id)
    end

    def blog
        @blog = Blog.find(params[:id])
    end
end
