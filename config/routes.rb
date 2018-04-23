Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      mount ActionCable.server => '/cable'
      resources :messages
      resource :sessions, only: :create
      resources :users
      post 'user_token' => 'user_token#create'
    end
  end
end
