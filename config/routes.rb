Rails.application.routes.draw do
  devise_for :users, except: :destroy, controllers: { registrations: 'users/registrations'}
  get "users/:id/bookings", to: "bookings#user_index", as: :user_bookings

  root to: 'tennis_courts#index'
  resources :tennis_courts do
    resources :bookings
  end
end
