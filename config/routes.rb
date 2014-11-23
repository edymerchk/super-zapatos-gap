Rails.application.routes.draw do

  root to: "home#index"

  resources :articles
  resources :stores

  mount API::Base => '/services'

end
