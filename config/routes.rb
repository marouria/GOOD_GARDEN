Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits, only: [:new, :create, :show] do
    patch 'toolkit', to: 'kits#add_toolkit'
    patch 'gloves', to: 'kits#add_gloves'
    patch 'soil', to: 'kits#add_soil'
    patch 'toolkitremove', to: 'kits#remove_toolkit'
    patch 'glovesremove', to: 'kits#remove_gloves'
    patch 'soilremove', to: 'kits#remove_soil'
    resources :orders, only: [:create] do
      resources :payments, only: :new
    end

    resources :reviews, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :plants, only: [:show, :index]
    end
  end

  get 'dashboard', to: 'dashboards#index'
  get 'preferences', to: 'pages#preferences_form'
  post 'preferences', to: 'pages#submit_preferences_form'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
