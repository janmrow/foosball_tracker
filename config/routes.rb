Rails.application.routes.draw do
  root 'players#index'
  resources :players
end
