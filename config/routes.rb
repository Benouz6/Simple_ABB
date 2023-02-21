Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  # get 'flats', to: 'flats#index'
  # get "flats/new", to: "flats#new"
  # get "flats/:id", to: "flats#show", as: :flat
  # post "flats", to: "flats#create"
  resources :flats

end
