Rails.application.routes.draw do
  devise_for :admins, only: :session
  resources :users

  get 'reports/:patient_id', to:'reports#index'

  get 'homepage', to: 'home#homepage'
  post 'get_reports', to: 'home#get_reports'
  root to: 'home#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
