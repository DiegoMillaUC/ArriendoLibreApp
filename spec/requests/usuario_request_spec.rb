# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Usuario, type: :request do
  before(:all) do
    @usuario = create(:usuario, email: Faker::Internet.email, password: '12123123')
    @usuario.save
  end

  describe 'POST /usuarios' do
    it 'should not create a usuario' do
      expect do
        post usuarios_path, params: {
          usuario: {
            nombre: '',
            email: @usuario.email,
            telefono: @usuario.telefono,
            password: @usuario.password
          }
        }
      end.to change(Usuario, :count).by(0)
    end
    it 'should not create a usuario' do
      expect do
        post usuarios_path, params: {
          usuario: {
            nombre: @usuario.nombre,
            email: '',
            telefono: @usuario.telefono,
            password: @usuario.password
          }
        }
      end.to change(Usuario, :count).by(0)
    end
    it 'should not create a usuario' do
      expect do
        post usuarios_path, params: {
          usuario: {
            nombre: @usuario.nombre,
            email: @usuario.email,
            telefono: '',
            password: @usuario.password
          }
        }
      end.to change(Usuario, :count).by(0)
    end
    it 'should not create a usuario' do
      expect do
        post usuarios_path, params: {
          usuario: {
            nombre: @usuario.nombre,
            email: @usuario.email,
            telefono: @usuario.telefono,
            password: ''
          }
        }
      end.to change(Usuario, :count).by(0)
    end
    it 'should not create a usuario' do
      expect do
        post usuarios_path, params: {
          usuario: {
            nombre: @usuario.nombre,
            email: 'hola',
            telefono: @usuario.telefono,
            password: @usuario.password
          }
        }
      end.to change(Usuario, :count).by(0)
    end
  end
  describe 'PATCH /usuarios/:id' do
    it 'should update a usuario\'s year' do
      patch usuarios_path(@usuario), params: {
        usuario: {
          nombre: @usuario.nombre,
          email: @usuario.email,
          telefono: '',
          password: @usuario.password
        }
      }
      expect(Usuario.find(@usuario.id).telefono).to eq(@usuario.telefono)
    end
    it 'should update a usuario\'s year' do
      patch usuarios_path(@usuario), params: {
        usuario: {
          nombre: @usuario.nombre,
          email: '',
          telefono: @usuario.telefono,
          password: @usuario.password
        }
      }
      expect(Usuario.find(@usuario.id).email).to eq(@usuario.email)
    end
    it 'should update a usuario\'s year' do
      patch usuarios_path(@usuario), params: {
        usuario: {
          nombre: '',
          email: @usuario.email,
          telefono: @usuario.telefono,
          password: @usuario.password
        }
      }
      expect(Usuario.find(@usuario.id).nombre).to eq(@usuario.nombre)
    end
    it 'should update a usuario\'s year' do
      patch usuarios_path(@usuario), params: {
        usuario: {
          nombre: @usuario.nombre,
          email: 'asd#',
          telefono: @usuario.telefono,
          password: @usuario.password
        }
      }
      expect(Usuario.find(@usuario.id).email).to eq(@usuario.email)
    end
  end
end
