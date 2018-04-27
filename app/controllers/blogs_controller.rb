class BlogsController < ApplicationController
    layout 'home'

    def index
        topic_id = params[:topic_id].to_i
        @blogs = topic_id != 0 ? Topic.find(topic_id).blogs.page(@page).per(@per_page) : nil
    end

    def show
        blog_id = params[:id]
        @blog = Blog.find(blog_id)
    end
end
