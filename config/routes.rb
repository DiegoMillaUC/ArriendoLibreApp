# frozen_string_literal: true

Rails.application.routes.draw do
  resources :datos
  get 'carros/show'
  # resources :resenas
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :usuarios, controllers: {
    registrations: 'usuarios/registrations'
  }
  resources :reservas

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

  get 'carros/:id' => 'carros#show', as: 'carro'
  delete 'carros/:id' => 'carros#destroy'

  post 'carro_items/:id/anadir' => 'carro_items#anadir_cantidad', as: 'carro_item_anadir'
  post 'carro_items/:id/reducir' => 'carro_items#reducir_cantidad', as: 'carro_item_reducir'
  post 'carro_items' => 'carro_items#create'
  get 'carro_items/:id' => 'carro_items#show', as: 'carro_item'
  delete 'carro_items/:id' => 'carro_items#destroy'

  root 'home#index'
end
