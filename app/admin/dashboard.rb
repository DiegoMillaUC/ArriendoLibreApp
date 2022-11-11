# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Últimas Reservas" do
           ul do
             Reserva.all.slice(0, 5).map do |reserva|
               li link_to(reserva.producto.nombre, admin_reserva_path(reserva))
             end
           end
         end
       end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end
end
