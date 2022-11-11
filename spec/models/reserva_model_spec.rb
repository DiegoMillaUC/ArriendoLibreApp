# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reserva, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:reserva)).to be_valid
    end
  end
end
