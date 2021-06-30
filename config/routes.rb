Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kits, only: [:new, :create, :show] do
    patch 'tool', to: 'kits#add_tool'
    resources :orders, only: [:create] do
      resources :payments, only: :new
    end

    resources :reviews, only: [:new, :create]
  end

  resources :plants, only: [:show, :index]

  get 'dashboard', to: 'dashboards#index'
  get 'preferences', to: 'pages#preferences_form'
  post 'preferences', to: 'pages#submit_preferences_form'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
