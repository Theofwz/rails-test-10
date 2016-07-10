Rails.application.routes.draw do
  devise_for :users
  
  resources :comments, only: [:index, :new, :create]

  root 'comments#index'
end
