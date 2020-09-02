Rails.application.routes.draw do

  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  resources :comments
  resources :reviews
  resources :books do
    resources :reviews
  end
  resources :genres do
    resources :books
  end
  resources :users, except: [:new] do
    resources :reviews
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
