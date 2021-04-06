Rails.application.routes.draw do
  resources :subjects
  resources :notes
  resources :users, only: [:show, :edit, :update, :create]

  get '/signup', to: "users#new"
  
  get '/login', to: "session#new"
  post '/login', to: "session#create" #to process the information
  
  get '/logout', to: "session#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
