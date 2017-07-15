Rails.application.routes.draw do
  root to: "pages#index"

  get "/rsvp", to: "pages#rsvp"
  post "/search", to: "pages#search"
  get "/search", to: "pages#search"

  resources :invitations do
    resources :guests, only: [:new, :create, :destroy]
  end
end
