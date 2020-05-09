Rails.application.routes.draw do
  root to: 'static#index'

  resources :documents
end
