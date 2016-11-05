require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :restaurants do
    member do
      get 'city'
      get 'list'
    end
  end
  resources :ads
  resources :apply_services, only: [:index, :show, :create, :destroy, :accept, :decline] do
    member do
      get 'accept'
      get 'decline'
    end
  end
  resources :notices, except: [:show]
  resources :categories
  resources :activity_services do
    collection do
      get 'search'
    end
  end
  resources :prefectures, only: [] do
    resources :major_cities, only: [:ajax] do
      collection do
        get 'ajax'
      end
    end
  end
  resources :major_cities
  resources :listings, :replace_id_with => 'access_token'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  resources :payments, only: [:index, :new] do
    collection do
      post 'purchase'
    end
  end

end
