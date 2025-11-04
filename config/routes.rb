Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  resources :users, only: [:show, :index] do
    resource :relationships, only: [:create, :destroy]
  end
  resources :notifications, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
