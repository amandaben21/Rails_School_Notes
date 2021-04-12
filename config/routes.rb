Rails.application.routes.draw do
  root "sessions#home"
  
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create" #to process the information
  
  get '/logout', to: "sessions#destroy"

  resources :notes
  resources :users
  resources :subjects

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
