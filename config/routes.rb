Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root "main_page#index"

  resources :appointments do
    resources :doctors_recommendations
  end
  get "/main_page", to: "main_page#index"

  resources :patients
  resources :doctors
  resources :users

  resources :doctors, only: nil do
    resources :appointments
  end

  resources :doctors_categories, only: nil do
    resources :doctors, only: :index
  end

  # get 'my_appointment', to: 'users#show'
  #get "/patients/:id/edit", to: "patients#edit"
end
