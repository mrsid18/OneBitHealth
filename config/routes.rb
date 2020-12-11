# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :appointments do
    resources :exams
    resources :treatments
  end

  get '/dashboard', to: 'dashboard#index'

  devise_for :users
  get '/user' => 'dashboard#index', :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
