Rails.application.routes.draw do

  devise_for :users

  resources :application_cycles do
    resources :school_applications
  end

  get 'home/index'
  root "home#index"
end
