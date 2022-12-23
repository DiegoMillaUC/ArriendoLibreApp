# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarrosController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
  describe 'delete' do
    it 'returns http success' do
      @carro_actual = Carro.create
      delete :destroy, params: { id: @carro_actual.id }
      expect(response).to have_http_status(:found)
    end
  end
end
