Rails.application.routes.draw do
  root to: "pages#index"

  get "/rsvp", to: "pages#rsvp"
  post "/search", to: "pages#search"
  get "/search", to: "pages#search"

  resources :guests
end
