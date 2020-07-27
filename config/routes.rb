Rails.application.routes.draw do
	root to: "links#index"

  resources :custom_domains
  resources :links

  get "/:slug", to: "redirect_links#new", as: :redirect
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
