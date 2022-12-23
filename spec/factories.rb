# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :carro do
  end

  factory :producto do
    nombre { 'Pelota' }
    precio { 123 }
    descripcion { 'bla bla' }
    stock_actual { 1 }
    stock_total { 3 }
    disponible { true }
    categoria { 'Futbol' }
  end

  factory :usuario do
    nombre { 'Diego' }
    email { 'juan@uc.cl' }
    encrypted_password { 'j12345' }
    telefono { '12345678' }
  end

  factory :reserva do
    usuario
    descripcion { 'bla bla bla' }
    fecha_inicio { '202310021530' }
    fecha_termino { '202311021530' }
    aceptado { 1 }
  end

  factory :carro_item do
    producto
    carro
    reserva
    cantidad { 1 }
  end

  factory :resena do
    usuario
    producto
    calificacion { 3.4 }
    contenido { 'bla bla' }
  end

  factory :message do
    usuario
    body { 'bla bla' }
  end

  factory :conversation do
    sender
    recipient
  end
end
