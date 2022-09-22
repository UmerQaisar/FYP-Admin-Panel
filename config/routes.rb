Rails.application.routes.draw do
  devise_for :admins, only: :session
  resources :users

  get 'reports/:patient_id', to:'reports#index'
  get 'reports/:patient_id/:category', to:'reports#category'

  get 'homepage', to: 'home#homepage'
  get 'get_reports', to: 'home#get_reports'
  root to: 'home#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
