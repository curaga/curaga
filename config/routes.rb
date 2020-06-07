# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static#index'

  namespace :internal, path: '-' do
    resources :namespaces, only: [], module: :namespaces do
      get '/', to: redirect('/-/namespaces/%{namespace_id}/settings')
      resource :settings, only: [:show, :update]
    end
  end

  scope path: '-' do
    devise_for :users
    resources :docs, except: :show, as: :documents
  end

  get '@:slug', to: 'namespaces#show', as: :namespace
  scope path: '@:slug', module: :namespaces do
    resources :docs, controller: :docs, except: :index, as: :namespace_doc
  end
end
