# frozen_string_literal: true

class Resena < ApplicationRecord
  belongs_to :usuario
  belongs_to :producto
  validates :calificacion, :contenido, presence: true
  validates :calificacion, numericality: { only_float: true, less_than: 10.1, greater_than: -0.1 }
end
