# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reserva, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:reserva)).to be_valid
    end
    it ' debe ser antes de la fecha término' do
      reserva = build(:reserva)
      reserva.fecha_inicio = reserva.fecha_termino
      expect(reserva).to_not be_valid
    end
    it ' debe ser valida' do
      reserva = build(:reserva)
      reserva.fecha_inicio = '202010021530'
      expect(reserva).to_not be_valid
    end
  end
end
