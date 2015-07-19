Rails.application.routes.draw do
  get 'matches/new'

  root 'players#index'
  resources :players
  resources :matches
end
