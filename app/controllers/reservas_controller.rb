# frozen_string_literal: true

class ReservasController < ApplicationController
  before_action :authenticate_usuario!

  def aceptar
    @reserva = Reserva.find(params[:id])
    @reserva.update(aceptado: 2)
    redirect_to usuario_reservas_path(current_usuario)
  end

  def rechazar
    @reserva = Reserva.find(params[:id])
    @reserva.carro_items.each do |item|
      item.producto.update_attributes(stock_actual: item.producto.stock_actual + item.cantidad)
      item.producto.update_attributes(disponible: true)
    end
    @reserva.update(aceptado: 1)
    redirect_to usuario_reservas_path(current_usuario)
  end

  def index
    @reservas = []
    Reserva.all.each do |reserva|
      @reservas << reserva if reserva.usuario_id == current_usuario.id
    end
    @reservas
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
    @carro_items = @carro_actual.carro_items
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)
    @reserva.usuario_id = current_usuario.id
    @carro_actual.carro_items.each do |item|
      @reserva.carro_items << item
      item.carro_id = nil
      # item.producto.update_attributes(stock_actual: item.producto.stock_actual - item.cantidad)
      # item.producto.update_attributes(disponible: false) if item.producto.stock_actual.zero?
    end
    if @reserva.save
      @carro_actual.carro_items.each do |item|
        # item.carro_id = nil
        item.producto.update_attributes(stock_actual: item.producto.stock_actual - item.cantidad)
        item.producto.update_attributes(disponible: false) if item.producto.stock_actual.zero?
      end
      Carro.destroy(session[:carro_id])
      session[:carro_id] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to producto_url(@reserva), notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy
    redirect_to root_path
  end
  # Only allow a list of trusted parameters through.

  private

  def reserva_params
    params.require(:reserva).permit(:descripcion, :fecha_inicio, :fecha_termino, :aceptado)
  end
end
