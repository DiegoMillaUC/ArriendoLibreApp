# frozen_string_literal: true

class Producto < ApplicationRecord
  has_one_attached :imagen
  validates :nombre, :precio, :descripcion, :stock_actual, :stock_total, :categoria, presence: true
  validates :precio, numericality: { only_integer: true, greater_than: 0 }
  validates :stock_actual, numericality: { only_integer: true, greater_than: -1 }
  validates :stock_actual, numericality: { only_integer: true, less_than_or_equal_to: :stock_total }
  validates :stock_total, numericality: { only_integer: true, greater_than: -1 }
  has_many :reservas
  has_many :resenas
end
