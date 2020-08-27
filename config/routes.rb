Rails.application.routes.draw do
  devise_for :users, except: :destroy, controllers: { registrations: 'users/registrations'}
  root to: 'tennis_courts#index'
  resources :tennis_courts
end
