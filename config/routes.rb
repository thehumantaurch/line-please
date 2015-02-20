Rails.application.routes.draw do
  root 'scripts#index'
  resources :scripts
  resources :scenes
  resources :characters
  resources :lines
end
