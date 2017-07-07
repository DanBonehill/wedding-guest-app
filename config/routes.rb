Rails.application.routes.draw do
  root to: "pages#index"

  get "/rsvp", to: "pages#rsvp"

  resources :guests
end
