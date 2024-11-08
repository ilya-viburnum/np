Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root "pages#home"

  resources :posts
  resource :dashboard, only: :show

  # Default routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
