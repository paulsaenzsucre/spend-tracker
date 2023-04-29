Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  
  root 'categories#index'
  get '/splashscreen', to: 'splashscreen#index'
  resources :categories, only: [:index, :new] do
    resources :expenses, only: [:index]
  end
end
