require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  resource :dashboard, only: [:show]
  resources :custom_domains
  resources :links

  # Plans
  resources :user_plans
  resource :subscriptions, only: [:destroy]

  # Settings
  resource :settings, only: [:show]
  resource :billing, only: [:show]

  root to: "dashboard#show"

  authenticate :user do |user|
    mount Sidekiq::Web => "/sidekiq"
  end

  get "/:slug", to: "redirect_links#new", as: :redirect
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
