Rails.application.routes.draw do
  devise_for :users, except: :destroy, controllers: { registrations: 'users/registrations'}
  root to: 'tennis_courts#index'
  resources :tennis_courts do
    get "bookings/slots", to: "bookings#slots"
    get "bookings/confirm", to: "bookings#confirm"
    resources :bookings
  end
end
