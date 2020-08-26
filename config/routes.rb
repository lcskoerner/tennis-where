Rails.application.routes.draw do
  devise_for :users
  root to: 'tennis_courts#index'
  resources :tennis_courts
end
