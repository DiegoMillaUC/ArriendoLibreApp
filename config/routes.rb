# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :resenas
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :usuarios, controllers: {
    registrations: 'usuarios/registrations'
  }
  # resources :reservas

  resources :productos do
    resources :resenas
    resources :reservas
  end

  resources :usuarios do
    resources :resenas
    resources :reservas
  end

  resources :conversations do
    resources :messages
  end

  get '/reservas/:id/aceptar', to: 'reservas#aceptar'
  get '/reservas/:id/rechazar', to: 'reservas#rechazar'


  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
