Rails.application.routes.draw do
  root to: "pages#index"

  get "/rsvp", to: "pages#rsvp"
  post "/search", to: "pages#search"
  get "/search", to: "pages#search"
  get "/info", to: "pages#info"

  resources :invitations do
    resources :guests, only: [:new, :create, :destroy]
  end
end
