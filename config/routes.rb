Rails.application.routes.draw do
  resources :stores

  root to: "home#index"
end
