Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #Define Api routes
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index]
      resources :comments, only: [:index, :create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"


  

  # Defining the application routes for the user posts in the application
  resources :users, only: [:index,:show] do 
  resources :posts, only: [:index,:show,:new,:create,:destroy] do
  resources :comments,only: [:index, :new, :create,:destroy]
  resources :likes,only: [ :create]
  end
  end

end
