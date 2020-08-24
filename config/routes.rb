require "sidekiq/web"

Rails.application.routes.draw do
  get "/", to: "marketing#index"
  
  devise_for :users, path: "users", controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  devise_for :admin_users, path: "admin_users"

  resource :dashboard, only: [:show]
  resources :custom_domains
  resources :links

  # Plans
  resources :user_plans
  resource :subscriptions, only: [:destroy]

  # Settings
  # resource :settings, only: [:show]
  resource :billing, only: [:show]

  root to: "dashboard#show"

  authenticate :user do |user|
    mount Sidekiq::Web => "/sidekiq"
  end

  namespace :admin do
    resources :links, only: [:index]
    resources :custom_domains, only: [:index]
    resources :users, only: [:index]
  end
  get "/admin", to: "admin/links#index"

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unacceptable", via: :all
  get "/500", to: "errors#internal_error", via: :all

  # This must be the last route in the file
  get "/:slug", to: "redirect_links#new", as: :redirect
end
