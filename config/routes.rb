Rails.application.routes.draw do

  root "sessions#home"
  post '/', to: "sessions#home"
  
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create" #to process the information
  
  get '/logout', to: "sessions#destroy"

  resources :comments

  resources :notes do
    resources :subjects
  end
  
  resources :subjects, only:[:index, :show]

  resources :users do
    resources :notes, shallow: true
  end

  

  get '/auth/:provider/callback', to: "sessions#omniauth"

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
