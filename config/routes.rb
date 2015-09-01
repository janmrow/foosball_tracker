Rails.application.routes.draw do
  get 'pages/about'
  get 'matches/new'

  root 'pages#home'

  resources :players
  resources :matches

  get '*path' => redirect('/')
end
