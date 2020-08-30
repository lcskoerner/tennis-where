Rails.application.routes.draw do
  devise_for :users, except: :destroy, controllers: { registrations: 'users/registrations'}
  get "user_bookings", to: "bookings#user_index"

  root to: 'tennis_courts#index'
  resources :tennis_courts do
    resources :bookings
  end
end
