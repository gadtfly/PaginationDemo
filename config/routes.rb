Rails.application.routes.draw do
  resources :things, only: [:index]
end
