Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights
  resources :bookings
  resources :passengers

  root "flights#home"

  get "search_flights" => "flights#search_flights", as: "search_flights"
  get "book_flight" => "flights#book_flight", as: "book_flight"
end
