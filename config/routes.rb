Rails.application.routes.draw do
  root 'users#index'
  resources :scripts, only: [:index]
  resources :scenes
  resources :characters
  resources :lines
end
