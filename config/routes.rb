require 'sidekiq/web'

Rails.application.routes.draw do
  resources :ads
  mount Sidekiq::Web => '/sidekiq'

  resources :apply_services, only: [:index, :show, :create, :destroy, :accept, :decline] do
    member do
      get 'accept'
      get 'decline'
    end
  end
  resources :notices, except: [:show]
  resources :categories
  resources :activity_services
  resources :prefectures, only: [] do
    resources :major_cities, only: [:ajax] do
      collection do
        get 'ajax'
      end
    end
  end
  resources :major_cities, except: [:show]
  resources :listings, :replace_id_with => 'access_token'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  resources :payments, only: [:new] do
    collection do
      post 'purchase'
    end
  end

end
