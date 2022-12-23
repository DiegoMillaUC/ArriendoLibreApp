# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Carros', type: :request do
  before(:all) do
    @carro = create(:carro)
    @carro.save
  end

  describe 'SHOW /carros/:id' do
    it 'should show a carro' do
      expect do
        get carro_path(@carro)
      end.to change(Carro, :count).by(1)
    end
  end

  describe 'DELETE /carros/:id' do
    it 'should delete a carro' do
      expect do
        delete carro_path(@carro)
      end.to change(Carro, :count).by(0)
    end
  end
end
