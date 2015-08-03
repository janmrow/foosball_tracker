Rails.application.routes.draw do
  get 'pages/about'
  get 'matches/new'
  root 'pages#home'
  resources :players
  resources :matches

  # maybe some upgrades in routes?
end
