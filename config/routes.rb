Rails.application.routes.draw do
  root to: 'pages#index'
  resources :tennis_courts
end
