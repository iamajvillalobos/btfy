require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, path: "users", controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  devise_scope :user do
    get "login", to: "users/sessions#new"
    get "register", to: "users/registrations#new"
  end

  devise_for :admin_users, path: "admin_users"

  resource :dashboard, only: [:show]
  resources :custom_domains, except: [:show]
  resources :links, except: [:destroy]
  resource :support, only: [:new, :create]
  resource :account, only: [:show, :update]
  resource :billing, only: [:show] do
    get :waiting
  end
  resources :api_keys, only: [:index, :create, :edit, :update] do
    post :reactivate
    post :deactivate
  end
  resource :settings, only: [:show]

  # For removal
  resource :bio, only: [:show]
  resource :user_attributes, only: [:update]
  resources :public_profile_links, only: [:create, :destroy]
  resources :public_profile, only: [:show, :update]
  get "/@:username", to: "public_profile#show"

  authenticated :user do |user|
    root to: "dashboards#show", as: :authenticated_root
  end

  root to: "marketing#index"
  get "/terms", to: "marketing#terms"
  get "/privacy", to: "marketing#privacy"

  authenticate :admin_user do |user|
    mount Sidekiq::Web => "/sidekiq"
    root to: "admin/links#index", as: :authenticated_admin_root
  end

  namespace :admin do
    resources :links, only: [:index]
    resources :custom_domains, only: [:index]
    resources :users, only: [:index] do
      post :impersonate, on: :member
      post :stop_impersonating, on: :collection
    end
    end
  get "/admin", to: "admin/links#index"


  # API endpoints
  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end

  # Custom errors
  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unacceptable", via: :all
  get "/500", to: "errors#internal_error", via: :all

  # This must be the last route in the file
  get "/:slug", to: "redirect_links#new", as: :redirect
end
