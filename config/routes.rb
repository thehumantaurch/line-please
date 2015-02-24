Rails.application.routes.draw do
  root 'users#index'
  resources :scripts, only: [:index, :show]
  resources :scenes
  resources :characters
  resources :lines
end
