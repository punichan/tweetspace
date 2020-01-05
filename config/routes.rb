Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#top'

  resources :users do
    collection do
    end
    resources :relationships, only: [:create, :destroy]
      member do
        get :follows
        get :followers
      end
  end

  resources :tweets do
    collection do
      get 'follows'
      get 'likes'
      get 'mytweets'
      get 'top'
    end
    
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
