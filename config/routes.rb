Rails.application.routes.draw do
  resources :messages
  # resources :users
  resources, :users, param: :_username
  get '/hearts' => 'hearts#index'
  get "/auto_login", to: "users#auto_login"
  # post "/login", to: "users#login"
  post "/auth/login", to: "auth#login"
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
