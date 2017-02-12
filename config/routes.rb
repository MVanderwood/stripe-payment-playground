Rails.application.routes.draw do
  resources :products
  resources :transactions, only: [:new, :create]
end
