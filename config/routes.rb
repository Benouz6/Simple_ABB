Rails.application.routes.draw do
  devise_for :users

  root to: "flats#index"

  resources :flats do
    resources :bookings, only: %i[new create]
  end

  get '/my_flats', to: "flats#my_flats"

  get '/my_travels', to: "bookings#my_travels", as: :my_travels
  get '/my_reservations', to: "bookings#my_reservations", as: :my_reservations

  patch '/bookings/:id/accepted', to: "bookings#accepted", as: :accepted
  patch '/bookings/:id/rejected', to: "bookinks#rejected", as: :rejected
end
