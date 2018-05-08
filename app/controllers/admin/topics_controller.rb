class Admin::TopicsController < ApplicationController
    before_action :authenticate_admin
    before_action :topic, only:[:edit,:update]
    layout "desk"

    def index
        @topics = Topic.all.page(@page).per(@per_page)
    end

    def new
        @topic = Topic.new
    end

    def create
        topic = Topic.new(image:params[:topic][:image],title:params[:topic][:title],description:params[:topic][:description])
        if topic.save
            redirect_to admin_topics_path
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @topic.update(image:params[:topic][:image],title:params[:topic][:title],description:params[:topic][:description])
            redirect_to admin_topics_path
        else
            render "edit"
        end
    end

    private
    
    def topic_params
        params.require(:topic).permit(:image, :title, :description)
    end

    def topic
        @topic = Topic.find(params[:id])
    end
end
