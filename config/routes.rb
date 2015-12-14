Rails.application.routes.draw do
  resources :users
  resources :payments, only: [:index, :new, :create]

  root to: "payments#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :payments, only: [:index, :create]
    end
  end
end
