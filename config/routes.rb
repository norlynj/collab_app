Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :tasks
  resources :comments
  resources :deadlines
  resources :labels
  resources :update_logs
  resources :dashboard, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
