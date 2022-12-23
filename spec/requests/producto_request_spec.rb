# frozen_string_literal: true

require 'rails_helper'
include AuthHelper

RSpec.describe Producto, type: :request do
  before(:each) do
    login_usuario
  end
  before(:all) do
    @producto = create(:producto)
    @producto.save
  end

  describe 'POST /productos' do
    it 'should create a producto' do
      expect do
        post productos_path, params: {
          producto: {
            nombre: @producto.nombre,
            precio: @producto.precio,
            descripcion: @producto.descripcion,
            stock_actual: @producto.stock_actual,
            stock_total: @producto.stock_total,
            disponible: @producto.disponible,
            categoria: @producto.categoria
          }
        }
      end.to change(Producto, :count).by(1)
    end

    it 'should not create a producto with invalid data' do
      expect do
        post productos_path, params: {
          producto: {
            nombre: @producto.nombre,
            precio: -1,
            descripcion: @producto.descripcion,
            stock_actual: @producto.stock_actual,
            stock_total: @producto.stock_total,
            disponible: @producto.disponible,
            categoria: @producto.categoria
          }
        }
      end.to change(Producto, :count).by(0)
    end

    it 'should not create a producto with invalid data' do
      expect do
        post productos_path, params: {
          producto: {
            nombre: '',
            precio: @producto.precio,
            descripcion: @producto.descripcion,
            stock_actual: @producto.stock_actual,
            stock_total: @producto.stock_total,
            disponible: @producto.disponible,
            categoria: @producto.categoria
          }
        }
      end.to change(Producto, :count).by(0)
    end

    it 'should not update a producto with invalid data' do
      expect do
        post productos_path, params: {
          producto: {
            nombre: @producto.nombre,
            precio: @producto.precio,
            descripcion: @producto.descripcion,
            stock_actual: @producto.stock_actual,
            stock_total: @producto.stock_total,
            disponible: @producto.disponible,
            categoria: ''
          }
        }
      end.to change(Producto, :count).by(0)
    end
    it 'should not update a producto with invalid data' do
      expect do
        post productos_path, params: {
          producto: {
            nombre: @producto.nombre,
            precio: @producto.precio,
            descripcion: @producto.descripcion,
            stock_actual: @producto.stock_total + 1,
            stock_total: @producto.stock_total,
            disponible: @producto.disponible,
            categoria: @producto.categoria
          }
        }
      end.to change(Producto, :count).by(0)
    end
  end

  describe 'PATCH /productos/:id' do
    it 'should update a producto\'s year' do
      patch producto_path(@producto), params: {
        producto: {
          nombre: @producto.nombre,
          precio: 2020,
          descripcion: @producto.descripcion,
          stock_actual: @producto.stock_actual,
          stock_total: @producto.stock_total,
          disponible: @producto.disponible,
          categoria: @producto.categoria
        }
      }
      expect(Producto.find(@producto.id).precio).to eq(2020)
    end

    it 'should not update a producto with invalid data' do
      patch producto_path(@producto), params: {
        producto: {
          nombre: @producto.nombre,
          precio: 2020,
          descripcion: @producto.descripcion,
          stock_actual: -1,
          stock_total: @producto.stock_total,
          disponible: @producto.disponible,
          categoria: @producto.categoria
        }
      }
      expect(Producto.find(@producto.id).stock_actual).to eq(@producto.stock_actual)
    end

    it 'should not update a producto with invalid data' do
      patch producto_path(@producto), params: {
        producto: {
          nombre: @producto.nombre,
          precio: @producto.precio,
          descripcion: @producto.descripcion,
          stock_actual: @producto.stock_total + 1,
          stock_total: @producto.stock_total,
          disponible: @producto.disponible,
          categoria: @producto.categoria
        }
      }
      expect(Producto.find(@producto.id).stock_actual).to eq(@producto.stock_actual)
    end

    it 'should not update a producto with invalid data' do
      patch producto_path(@producto), params: {
        producto: {
          nombre: @producto.nombre,
          precio: @producto.precio,
          descripcion: @producto.descripcion,
          stock_actual: @producto.stock_actual,
          stock_total: @producto.stock_total,
          disponible: @producto.disponible,
          categoria: ''
        }
      }
      expect(Producto.find(@producto.id).categoria).to eq(@producto.categoria)
    end
  end

  describe 'DELETE /productos/:id' do
    it 'should delete a producto' do
      expect do
        delete producto_path(@producto)
      end.to change(Producto, :count).by(-1)
    end
  end
end
