Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#top'

  resources :users do
    resources :relationships, only: [:create, :destroy]
      member do
        get :follows
        get :followers
      end
  end

  resources :tweets do
    collection do
      get :comment_tweets
      get :follows
      get :likes
      get :mytweets
      get :top
    end

    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :likes,     only: [:create, :destroy]
  end

  resources :groups,     only: [:new, :create, :update, :destroy] do
    resources :messages, only: [:index, :create, ]
  end
end
