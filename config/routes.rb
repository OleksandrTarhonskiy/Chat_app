require 'api_contraints.rb'

ChatApp::Application.routes.draw do
  devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      mount ActionCable.server => '/cable'
      resources :messages
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end
end
