Rails.application.routes.draw do
  resources :cat_exps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  
  root 'categories#index'
  get '/splashscreen', to: 'splashscreen#index'
  resources :categories, only: [:index, :new, :create] do
    resources :cat_exps, only: [:index, :new, :create]
  end
  resources :expenses, only: [:new, :create]
end
