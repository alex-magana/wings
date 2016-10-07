Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights
  resources :bookings
  resources :passengers

  root "flights#home"

  get "search_flights" => "flights#search_flights", as: "search_flights"
  post "confirm_booking" => "bookings#confirm_booking", as: "confirm_booking"
  get  "search_booking" => "bookings#search_booking", as: "search_booking"
end
