Rails.application.routes.draw do
  resources :articles

  resources :stores

  root to: "home#index"
end
