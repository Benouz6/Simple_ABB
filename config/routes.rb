Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  # get 'flats', to: 'flats#index'
  # get "flats/new", to: "flats#new"
  # get "flats/:id", to: "flats#show", as: :flat
  # post "flats", to: "flats#create"
  get '/my_flats', to: "flats#my_flats"
  resources :flats
end
