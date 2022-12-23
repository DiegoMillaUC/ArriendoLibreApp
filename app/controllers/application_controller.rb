# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :carro_actual

  private

  def carro_actual
    if session[:carro_id]
      carro = Carro.find_by(id: session[:carro_id])
      if carro.present?
        @carro_actual = carro
      else
        session[:carro_id] = nil
      end
    end

    if session[:carro_id].nil?
      @carro_actual = Carro.create
      session[:carro_id] = @carro_actual.id
    end
  end
end
