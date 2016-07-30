Rails.application.routes.draw do


  devise_for :users

  get 'dashboard/index'

  resources :users do
    resources :exercises
  end
  



  root to: 'dashboard#index'


end
