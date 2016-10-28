Rails.application.routes.draw do
  get 'store/index'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #定义根网址
  root :to => 'store#index',:as => 'store'
end
