# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'static#index'

  scope path: '-' do
    resources :docs, except: :show
  end

  get '@:slug', to: 'namespaces#show', as: :namespace
  scope path: '@:slug', module: :namespaces do
    resources :docs, controller: :docs, except: :index, as: :namespace_doc
  end
end
