Rails.application.routes.draw do

  resources :travels do
    resources :toll_boths
    resources :fuels
    resources :meals
    resources :lodgings
  end

  resources :vehicles
  resources :cities
  resources :states

  root to: 'visitors#index'

  devise_for :users

  get 'contact/index'
end
