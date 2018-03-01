Rails.application.routes.draw do

  root 'users#home', as: 'home'

  resources :rides
  resources :attractions
  resources :users
  resources :sessions, only: [:create, :destroy]
  get '/signin', to: 'sessions#new', as: 'new_session'
end
