# frozen_string_literal: true

class Carro < ApplicationRecord
  has_many :carro_items, dependent: :destroy
  has_many :productos, through: :carro_items
end
