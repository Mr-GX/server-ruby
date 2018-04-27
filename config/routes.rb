Rails.application.routes.draw do
  devise_for :users , controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics do
    resources :blogs
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
