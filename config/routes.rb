Rails.application.routes.draw do
  resources :messages
  # resources :users
  resources :users
  resources :hearts
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/hearts' => 'hearts#index'
  post '/hearts' => 'hearts#create'
  get '/total_likes_given' => 'users#total_likes_given'
  get '/total_unique_likers' => 'users#total_unique_likers'

  get '/messages_recieved' => 'messages#show_total_recieved'

end
 