Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root "pages#home"

  resource :dashboard, only: :show

  resources :feeds, only: :index do
    get :export, on: :collection
  end

  resources :posts, except: :index do
    patch "submit_review", on: :member
    patch "approve", on: :member
    patch "reject", on: :member
  end

  get "posts_on_review" => "pages#posts_on_review"


  # Default routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
