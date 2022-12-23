# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarroItem, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:carro_item)).to be_valid
    end
    it ' No puedes superar stock actual' do
      item = build(:carro_item)
      item.cantidad = item.producto.stock_actual + 1
      expect(item).to_not be_valid
    end
  end
end
