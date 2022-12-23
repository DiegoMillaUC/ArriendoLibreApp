# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
