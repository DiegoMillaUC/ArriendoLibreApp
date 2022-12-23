# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReservasController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'Create' do
    it 'returns http success' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      get :create,
          params: { reserva: { usuario_id: @usuario.id, descripcion: 'asd', fecha_inicio: DateTime.now + 1,
                               fecha_termino: DateTime.now + 2 } }
      expect(response).to have_http_status(:found)
    end
  end
  describe 'destruir' do
    it 'destruir item' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      @reserva = Reserva.create!(usuario_id: @usuario.id, descripcion: 'asd', fecha_inicio: DateTime.now + 1,
                                 fecha_termino: DateTime.now + 2)
      delete :destroy, params: { id: @reserva.id }
      expect(response).to have_http_status(:found)
    end
  end
  describe 'aceptar' do
    it 'aceptar' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      @reserva = Reserva.create!(usuario_id: @usuario.id, descripcion: 'asd', fecha_inicio: DateTime.now + 1,
                                 fecha_termino: DateTime.now + 2)
      get :aceptar, params: { id: @reserva.id }
      expect(response).to have_http_status(:found)
    end
  end
  describe 'rechazar' do
    it 'rechazar' do
      @usuario = Usuario.create!(nombre: 'as', telefono: 5_698_621_502, email: 'asd@uc.cl', password: 'admin76',
                                 password_confirmation: 'admin76')
      sign_in @usuario
      @reserva = Reserva.create!(usuario_id: @usuario.id, descripcion: 'asd', fecha_inicio: DateTime.now + 1,
                                 fecha_termino: DateTime.now + 2)
      get :rechazar, params: { id: @reserva.id }
      expect(response).to have_http_status(:found)
    end
  end
end
