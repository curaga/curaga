Rails.application.routes.draw do
  devise_for :users
  root to: 'static#index'

  resources :documents

  get '/@:id', to: 'namespaces#show', as: :namespace
end
