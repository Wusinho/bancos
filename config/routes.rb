Rails.application.routes.draw do
  resources :banks
  resources :providers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepages#index"
end

