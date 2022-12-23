# frozen_string_literal: true

class CarroItemsController < ApplicationController
  include CarroItemsHelper
  def create
    producto_elegido = Producto.find(params[:producto_id])
    carro_actual = @carro_actual

    if carro_actual.productos.include?(producto_elegido)
      @carro_item = carro_actual.carro_items.find_by(producto_id: producto_elegido)
      if @carro_item.cantidad < @carro_item.producto.stock_actual
        @carro_item.cantidad += 1
        @carro_item.save
      end
      redirect_to carro_path(carro_actual)
    elsif producto_elegido.stock_actual.positive?

      @carro_item = CarroItem.new
      @carro_item.cantidad = 1
      @carro_item.carro = carro_actual
      @carro_item.producto = producto_elegido
      @carro_item.save
      redirect_to carro_path(carro_actual)
    end
  end

  def anadir_cantidad
    @carro_item = CarroItem.find(params[:id])
    @carro_item.cantidad += 1 if @carro_item.cantidad < @carro_item.producto.stock_actual
    @carro_item.save
    redirect_to carro_path(@carro_actual)
  end

  def reducir_cantidad
    @carro_item = CarroItem.find(params[:id])
    @carro_item.cantidad -= 1 if @carro_item.cantidad > 1
    @carro_item.save
    redirect_to carro_path(@carro_actual)
  end

  def destroy
    @carro_item = CarroItem.find(params[:id])
    @carro_item.destroy
    redirect_to carro_path(@carro_actual)
  end

  private

  def carro_item_params
    params.require(:carro_item).permit(:cantidad, :producto_id, :carro_id)
  end
end
