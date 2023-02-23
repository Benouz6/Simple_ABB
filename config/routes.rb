Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get '/my_flats', to: "flats#my_flats"

  get '/my_travels', to: "bookings#my_travels", as: :my_travels

  resources :flats do
    resources :bookings, only: %i[new create]
  end
end
