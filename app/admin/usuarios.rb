# frozen_string_literal: true

ActiveAdmin.register Usuario do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.
  # md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
  # :remember_created_at, :nombre, :telefono
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
  # :remember_created_at, :nombre, :telefono]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  action_item :moderador, only: :show do
    if usuario.role == 'cliente'
      link_to 'Hacer Moderador', moderador_admin_usuario_path(usuario),
              method: :put
    end
  end

  member_action :moderador, method: :put do
    usuario = Usuario.find(params[:id])
    usuario.update(role: 1)
    redirect_to admin_usuario_path(usuario)
  end
end
