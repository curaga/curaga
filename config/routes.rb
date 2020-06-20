# frozen_string_literal: true

Rails.application.routes.draw do
  # Internal routes
  scope path: '-' do
    devise_for :users
  end

  namespace :internal, path: '-' do
    resources :namespaces, only: [], module: :namespaces do
      get '/', to: redirect('/-/namespaces/%{namespace_id}/settings')
      resource :settings, only: [:show, :update]
      resources :docs, except: :index, as: :documents
    end
  end

  # Namespace routes
  scope path: ':slug', module: :namespaces, constraints: { slug: /@[a-zA-Z0-9_]+/ } do
    get '/', to: 'docs#index', as: :namespace
    get '*id', to: 'docs#show', as: :namespace_doc
  end

  # Root routes
  root to: 'root#index'
  get '*id', to: 'root#show', as: :root_doc
end
