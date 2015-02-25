Rails.application.routes.draw do
  root 'users#index'
  resources :scripts, only: [:index, :show, :create, :update, :destroy]
  resources :scenes
  resources :characters
  resources :lines
end
