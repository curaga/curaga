Rails.application.routes.draw do
  devise_for :users
  root to: 'static#index'

  resources :documents, except: :new

  get '/new-page', to: 'documents#new', as: :new_document

  get '/@:id', to: 'namespaces#show', as: :namespace
end
