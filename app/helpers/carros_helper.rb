# frozen_string_literal: true

module CarrosHelper
  def total(carro)
    sum = 0
    carro.carro_items.each do |carro_item|
      sum += carro_item.cantidad * carro_item.producto.precio
    end
    sum
  end
end
