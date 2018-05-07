class TopicsController < ApplicationController
    layout 'home'

    def index
        @topics = Topic.all
    end
end
