Rails.application.routes.draw do
  resources :payments
  resources :payments

  root 'payments#index'
end
