Rails.application.routes.draw do
  resources :courses
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :courses, only: [:index, :show]
  # Defines the root path route ("/")
  root "home#index"
end
