# frozen_string_literal: true

class ProductosController < ApplicationController
  before_action :set_producto, only: %i[show edit update destroy]

  # GET /productos or /productos.json
  def index
    categoria_filtro = params[:categoria_filtro]
    @productos = if ['Todos', nil].include?(categoria_filtro)
                   Producto.all
                 else
                   Producto.where(categoria: categoria_filtro)
                 end
  end

  def new
    @producto = Producto.new
  end

  # GET /productos/1 or /productos/1.json
  def show; end

  # GET /productos/1/edit
  def edit; end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_url(@producto), notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to producto_url(@producto), notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_producto
    @producto = Producto.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def producto_params
    params.require(:producto).permit(:nombre, :imagen, :precio, :descripcion, :stock_actual, :stock_total, :disponible,
                                     :categoria)
  end
end
