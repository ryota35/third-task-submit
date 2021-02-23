Rails.application.routes.draw do
  root to: 'users#top'
  devise_for :users
  resources :users
  resources :books
  get '/home/about', to: 'homes#about'
end
