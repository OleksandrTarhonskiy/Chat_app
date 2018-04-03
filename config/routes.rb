Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :messages
  resource :sessions, only: :create
  resources :users
end
