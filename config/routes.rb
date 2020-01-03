Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'

  resources :users do
    collection do
      get 'search'
    end

    resources :relationships, only: [:create, :destroy]
      member do
        get :follows
        get :followers
      end
  end

  resources :tweets do
    collection do
      get 'search'
    end
    
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
