# frozen_string_literal: true

class ReservasController < ApplicationController
  before_action :authenticate_usuario!

  def aceptar
    @reserva = Reserva.find(params[:id])
    @reserva.update(aceptado: 2)
    @reserva.producto.update_attributes(stock_actual: @reserva.producto.stock_actual - 1)
    @reserva.producto.update_attributes(disponible: false) if @reserva.producto.stock_actual.zero?
    redirect_to usuario_resenas_path(current_usuario)
  end

  def rechazar
    @reserva = Reserva.find(params[:id])
    @reserva.update(aceptado: 1)
    redirect_to usuario_resenas_path(current_usuario)
  end

  def index
    @reservas = Array.new
    Reserva.all.each do |reserva|
      if reserva.usuario_id == current_usuario.id
        @reservas << reserva
      end
    end
    @reservas
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
    @producto = Producto.find(params[:producto_id])
  end

  # POST /reservas or /reservas.json
  def create
    @producto = Producto.find(params[:producto_id])
    @reserva = Reserva.new(reserva_params)
    @reserva.usuario_id = current_usuario.id
    @reserva.producto = @producto

    if @reserva.save
      redirect_to producto_path(@reserva.producto.id)
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
    redirect_to producto_path(@reserva.producto)
  end

  # Only allow a list of trusted parameters through.
  private

  def reserva_params
    params.require(:reserva).permit(:descripcion, :fecha_inicio, :fecha_termino, :aceptado)
  end
end
