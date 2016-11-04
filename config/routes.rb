Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :flights
  resources :bookings
  resources :passengers

  root "flights#index"

  get "login" => "users#login", as: "login"
  post "user_authenticate" => "users#user_authenticate", as: "user_authenticate"
  delete "logout" => "users#logout", as: "logout"
  get "reset_password" => "users#reset_password", as: "reset_password"
  post "send_reset_email" => "users#send_reset_email", as: "send_reset_email"
  get "search_flights" => "flights#search_flights", as: "search_flights", defaults: { format: 'js' }
  post "confirm_booking" => "bookings#confirm_booking", as: "confirm_booking"
  get "manage_bookings" => "bookings#manage_bookings", as: "manage_bookings"
  get "search_booking" => "bookings#search_booking", as: "search_booking"
end
