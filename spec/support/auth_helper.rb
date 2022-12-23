# frozen_string_literal: true

require 'spec_helper'
require 'faker'
module AuthHelper
  def login_usuario
    usuario = build(:usuario, email: Faker::Internet.email, password: '123123')
    usuario.save!
    sign_in usuario
  end
end
