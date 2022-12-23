# frozen_string_literal: true

class CarroItem < ApplicationRecord
  belongs_to :producto
  belongs_to :carro
  belongs_to :reserva, optional: true
  attribute :cantidad, :integer, default: 1

  validate :validate_sotck_quantity
  def validate_sotck_quantity
    errors.add :cantidad, ' No puedes superar stock actual' unless cantidad <= producto.stock_actual
  end
end
