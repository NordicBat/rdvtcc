Rails.application.routes.draw do

#  resources :users do
    resources :travels do
      resources :toll_booths
      resources :fuels
      resources :meals
      resources :lodgings
    end
#  end

  resources :vehicles
  resources :cities
  resources :states

  root to: 'visitors#index'

  devise_for :users

  get 'contact/index'
end
