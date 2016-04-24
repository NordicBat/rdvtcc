Rails.application.routes.draw do
  resources :travels
  resources :toll_boths
  resources :fuels
  resources :meals
  resources :lodgings
  resources :travels
  resources :toll_boths
  resources :fuels
  resources :meals
  resources :lodgings
  resources :travels
  resources :vehicles
  resources :cities
  resources :states
  root to: 'visitors#index'
  devise_for :users
end
