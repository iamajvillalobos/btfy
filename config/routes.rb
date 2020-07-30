require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  resources :custom_domains
  resources :links
  resource :billing, only: [:show]
  resource :dashboard, only: [:show]
  resource :settings, only: [:show]

  root to: "dashboard#show"

	authenticate :user do |user|
    mount Sidekiq::Web => '/sidekiq'
  end

  get "/:slug", to: "redirect_links#new", as: :redirect
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
