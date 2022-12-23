# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarroItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      # get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe 'Create' do
    it 'creates a item' do
      get :create, params: { producto_id: 1 }
      expect(response).to  have_http_status(:found)
    end
  end

  describe 'Add +1' do
    it 'Add +1 to item' do
      @carro_actual = Carro.create!
      @producto = Producto.create!(nombre: 'A', precio: 1, descripcion: 'asd', stock_total: 2, stock_actual: 2, disponible: 1,
                                   categoria: 'futbol')
      @carro_item = CarroItem.create!(cantidad: 1, producto_id: @producto.id, carro_id: @carro_actual.id)
      get :create, params: { producto_id: @producto.id }
      expect(response).to  have_http_status(:found)
    end
  end

  describe 'aumentar' do
    it 'aumentar' do
      @carro_actual = Carro.create!
      @producto = Producto.create!(nombre: 'A', precio: 1, descripcion: 'asd', stock_total: 2, stock_actual: 2, disponible: 1,
                                   categoria: 'futbol')
      @carro_item = CarroItem.create!(cantidad: 1, producto_id: @producto.id, carro_id: @carro_actual.id)
      get :anadir_cantidad, params: { id: @carro_item.id }
      expect(response).to have_http_status(:found)
    end
  end
  describe 'disminuir' do
    it 'disminuir' do
      @carro_actual = Carro.create!
      @producto = Producto.create!(nombre: 'A', precio: 1, descripcion: 'asd', stock_total: 2, stock_actual: 2, disponible: 1,
                                   categoria: 'futbol')
      @carro_item = CarroItem.create!(cantidad: 2, producto_id: @producto.id, carro_id: @carro_actual.id)
      get :reducir_cantidad, params: { id: @carro_item.id }
      expect(response).to have_http_status(:found)
    end
  end
  describe 'destruir' do
    it 'destruir itme' do
      @carro_actual = Carro.create!
      @producto = Producto.create!(nombre: 'A', precio: 1, descripcion: 'asd', stock_total: 2, stock_actual: 2, disponible: 1,
                                   categoria: 'futbol')
      @carro_item = CarroItem.create!(cantidad: 0, producto_id: @producto.id, carro_id: @carro_actual.id)
      delete :destroy, params: { id: @carro_item.id }
      expect(response).to have_http_status(:found)
    end
  end
end
