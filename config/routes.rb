Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :week_tables


  get 'events/ics_export', to: 'events#ics_export', as: "ics_export"
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
