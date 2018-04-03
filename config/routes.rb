Rails.application.routes.draw do
  resources :users
  mount ActionCable.server => '/cable'
  resources :messages
  resource :sessions, only: :create
  resources :users, only: [:create]
end
