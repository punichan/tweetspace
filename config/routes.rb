Rails.application.routes.draw do
  devise_for :users

  root to: 'tweets#index'
  resources :users
  resources :tweets do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
