Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  
  root 'splashscreen#index'
  get '/splashscreen', to: 'splashscreen#index'
end
