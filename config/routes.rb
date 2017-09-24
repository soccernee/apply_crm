Rails.application.routes.draw do
  resources :application_cycles
  resources :school_applications
  devise_for :users

  get 'home/index'
  root "home#index"

end
