Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "tweets#index"

  get "tweets/search"
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end


  get "messages/index"
  get "groups/index"
  resources :groups do
    resources :messages
  end

  resources :relationships,only: [:create, :destroy]
  resources :users,only: [:index, :edit, :update, :show] do
    member do
      get :following, :followers
    end
    
    resources :tweets do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end  
end
