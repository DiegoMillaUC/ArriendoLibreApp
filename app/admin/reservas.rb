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
    if reserva.aceptado.zero? && reserva.productos.all? { |producto| producto.disponible == true }
      link_to 'Aceptar', aceptar_admin_reserva_path(reserva),
              method: :put
    end
  end

  member_action :aceptar, method: :put do
    reserva = Reserva.find(params[:id])
    reserva.update(aceptado: 2)
    redirect_to admin_reserva_path(reserva)
  end

  action_item :rechazar, only: :show do
    reserva.carro_items.each do |item|
      item.producto.update_attributes(stock_actual: item.producto.stock_actual + item.cantidad)
    end
    link_to 'Rechazar', rechazar_admin_reserva_path(reserva), method: :put if reserva.aceptado.zero?
  end

  member_action :rechazar, method: :put do
    reserva = Reserva.find(params[:id])
    reserva.update(aceptado: 1)
    redirect_to admin_reserva_path(reserva)
  end
end
