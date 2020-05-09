Rails.application.routes.draw do
  root to: 'static#index'

  resources :documents

  get '/@:id', to: 'namespaces#show', as: :namespace
end
