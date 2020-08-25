Rails.application.routes.draw do
  root to: 'tennis_courts#index'
  resources :tennis_courts
end
