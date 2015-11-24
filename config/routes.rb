Rails.application.routes.draw do
  resources :users
  resources :payments, only: [:index, :new, :create]

  root to: "payments#index"
end
