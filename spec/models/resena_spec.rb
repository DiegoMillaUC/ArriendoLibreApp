# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resena, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:resena)).to be_valid
    end
  end
end
