# frozen_string_literal: true

class ResenasController < ApplicationController
  before_action :authenticate_usuario!

  def index
    @resenas = []
    Resena.all.each do |resena|
      @resenas << resena if resena.usuario_id == current_usuario.id
    end
    @resenas
  end

  def show
    @resena = Resena.find(params[:id])
  end

  # GET /resenas/new
  def new
    @resena = Resena.new
    @producto = Producto.find(params[:producto_id])
  end

  # POST /resenas or /resenas.json
  def create
    @producto = Producto.find(params[:producto_id])
    @resena = Resena.new(resena_params)
    @resena.usuario_id = current_usuario.id
    @resena.producto = @producto

    if @resena.save
      redirect_to producto_path(@resena.producto.id)
    else
      render :new
    end
  end

  def destroy
    @resena = Resena.find(params[:id])
    @resena.destroy
    redirect_to producto_path(@resena.producto)
  end

  # Only allow a list of trusted parameters through.
  private

  def resena_params
    params.require(:resena).permit(:calificacion, :contenido)
  end
end
