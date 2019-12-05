Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :users do
    resources :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end

  resources :tweets do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
