Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: [:index, :update, :show, :destroy]
  resources :clients, only: [:index, :update, :show]
end
