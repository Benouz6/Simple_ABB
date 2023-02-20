Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get 'flats', to: 'flats#index'
  get "flats/:id", to: "flats#show", as: :flat
end
