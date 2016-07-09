Rails.application.routes.draw do
  devise_for :users
  
  resources :comments, only: [:index]

  root 'comments#index'
end
