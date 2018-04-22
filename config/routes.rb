Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount ActionCable.server => '/cable'
      resources :messages
      resource :sessions, only: :create
      resources :users
    end
  end
end
