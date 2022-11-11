# frozen_string_literal: true

class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :imagen
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nombre, :email, :telefono, :encrypted_password, presence: true
  validates :encrypted_password, length: { minimum: 6 }
  enum role: %i[cliente moderador]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :usuario
  end
  has_many :resenas
  has_many :reservas
end
