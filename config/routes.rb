Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations'}

  get 'dashboard/index'

  resources :users do
    resources :exercises
  end

  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  root to: 'dashboard#index'

end
