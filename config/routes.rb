Rails.application.routes.draw do
  devise_for :users, except: :destroy, controllers: { registrations: 'users/registrations'}

  root to: "pages#home"

  get "users/:id/bookings", to: "bookings#user_index", as: :user_bookings
  get "bookings/search", to: "bookings#search", as: :bookings_search

  resources :tennis_courts do
    get "bookings/slots", to: "bookings#slots"
    get "bookings/confirm", to: "bookings#confirm"
    resources :reviews, only: [ :new, :create ]
    resources :bookings do
      
    end
  end
end
