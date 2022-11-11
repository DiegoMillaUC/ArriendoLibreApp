# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Producto, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:producto)).to be_valid
    end
  end
end
