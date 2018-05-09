Rails.application.routes.draw do
  namespace :admin do
    get 'homes/index'
  end

  devise_for :users , controllers: {registrations: 'users/registrations',sessions: 'users/sessions',passwords: "users/passwords"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics, only:[:index] do
    resources :blogs, only:[:index,:show] do
    end
  end
  namespace :admin do
    resources :homes, path: '/', only:[:index] do
    end
    resources :topics do
    end
    resources :blogs do
    end
    resources :users, only:[:index,:show] do
    end
  end
  namespace :api do
    namespace :v1 do
    end
  end
  resources :homes, path:"/", only:[] do
    collection do
      get :timeline
      get :about
    end
  end
  #设置程序首页
  root 'homes#index'	
end
