# frozen_string_literal: true

ActiveAdmin.register Reserva do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :descripcion, :fecha_inicio, :fecha_termino, :aceptado
  #
  # or
  #
  # permit_params do
  #   permitted = [:descripcion, :fecha_inicio, :fecha_termino, :aceptado]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  action_item :aceptar, only: :show do
    if reserva.producto.disponible? && reserva.aceptado.zero?
      link_to 'Aceptar', aceptar_admin_reserva_path(reserva),
              method: :put
    end
  end

  member_action :aceptar, method: :put do
    reserva = Reserva.find(params[:id])
    reserva.update(aceptado: 2)
    reserva.producto.update_attributes(stock_actual: reserva.producto.stock_actual - 1)
    reserva.producto.update_attributes(disponible: false) if reserva.producto.stock_actual.zero?
    redirect_to admin_reserva_path(reserva)
  end

  action_item :rechazar, only: :show do
    link_to 'Rechazar', rechazar_admin_reserva_path(reserva), method: :put if reserva.aceptado.zero?
  end

  member_action :rechazar, method: :put do
    reserva = Reserva.find(params[:id])
    reserva.update(aceptado: 1)
    redirect_to admin_reserva_path(reserva)
  end
end
