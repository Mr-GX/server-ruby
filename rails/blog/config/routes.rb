Rails.application.routes.draw do
  devise_for :users , controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  get 'welcome/index'
  #resources 方法，可以声明一个符合 REST 架构的资源。创建资源：指一系列类似的对象，使用rake routes生成path
  #对应ArticlesController和CommentsController，生成一些index/create/new/show/edit/update/destroy方法
  resources :articles do
  	resources :comments #嵌套资源，表明了文章和评论间的层级关系
  end
  
  namespace :api do
  	namespace :v1 do
  		resources :users,only:[:index,:show,:new,:create,:update,:destroy]
  	end
  end
  
  resources :users do
    collection do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #设置程序首页
  root 'welcome#index'	

end
