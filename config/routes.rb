Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :messages
  resource :sessions, only: :create
  resources :users, only: [:create, :email_confirmation] do
    collection do
      post :email_confirmation
    end
  end
end
