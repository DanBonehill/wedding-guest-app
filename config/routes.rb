Rails.application.routes.draw do
  root to: "pages#rsvp"

  get "/rsvp", to: "pages#rsvp"
  post "/search", to: "pages#search"
  get "/search", to: "pages#search"
  get "/info", to: "pages#info"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/contact", to: "messages#new"
  post "/contact", to: "messages#create"

  resources :invitations do
    resources :guests, only: [:new, :create, :destroy]
  end

  resources :messages, only: [:index, :show, :destroy]
end
