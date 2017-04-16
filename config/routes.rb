# frozen_string_literal: true
Rails.application.routes.draw do
  # Profile
  get 'user/:username', to: 'profile#show', constraints: { username: %r{[^/]+} }, as: :user
  get 'user/:username/edit', to: 'profile#edit', constraints: { username: %r{[^/]+} }, as: :profile_edit
  patch 'user/:username', to: 'profile#update', constraints: { username: %r{[^/]+} }, as: :profile_update

  # Language
  get 'language/:code', to: 'languages#show', constraints: { code: /[a-zA-Z0-9]{3}/ }
  patch 'language/:code', to: 'languages#update', constraints: { code: /[a-zA-Z0-9]{3}/ }
  get 'language/create', to: 'languages#new'
  post 'language/create', to: 'languages#create'

  # Account
  get 'account', to: 'account#edit', as: :account_edit
  patch 'account', to: 'account#update', as: :account_update

  # Static pages
  get 'about', to: 'static#about', as: :page_static_about

  # Admin
  get 'admin/langtypes', to: 'admin#langtypes_edit'
  post 'admin/langtypes', to: 'admin#langtypes_update'

  # Root
  root 'static#feed'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
