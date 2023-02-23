Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get '/my_flats', to: "flats#my_flats"

  get '/my_travels', to: "bookings#my_travels", as: :my_travels
  get '/my_reservations', to: "bookings#my_reservations", as: :my_reservations

  resources :flats do
    resources :bookings, only: %i[new create]
  end
end
