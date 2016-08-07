Rails.application.routes.draw do
  resources :health_check, only: [:index]
  resources :registrations, only: [:create]

  resources :accounts, only: [:create] do
    member do
      post :deposit
      post :withdraw
      post :transfer
    end
  end
end
