Rails.application.routes.draw do
  resources :hotels
  devise_for :users

  root "home#index"

  resources :users
end
