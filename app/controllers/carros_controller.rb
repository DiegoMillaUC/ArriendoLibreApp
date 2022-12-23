# frozen_string_literal: true

class CarrosController < ApplicationController
  include CarrosHelper
  def show
    @carro = @carro_actual
  end

  def destroy
    @carro = @carro_actual
    @carro.destroy
    session[:carro_id] = nil
    redirect_to root_path
  end
end
