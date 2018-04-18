Rails.application.routes.draw do
  devise_for :users , controllers: {registrations: 'users/registrations',sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #设置程序首页
  resources :homes, path:"/", only:[] do
    collection do
      get :about
    end
  end
  get "/about" => "homes#about"
  root 'homes#index'	
end
