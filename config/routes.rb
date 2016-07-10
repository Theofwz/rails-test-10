Rails.application.routes.draw do
  devise_for :users
  
  resources :comments, only: [:index, :new, :create] do
    resource :like, module: :comments
  end

  root 'comments#index'
end
