Rails.application.routes.draw do
  root 'users#index'
  resources :scripts
  resources :scenes
  resources :characters
  resources :lines
end
