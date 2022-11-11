# frozen_string_literal: true

ActiveAdmin.register Producto do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :nombre, :imagen, :precio, :descripcion, :stock_actual, :stock_total, :disponible, :categoria
  #
  # or
  #
  # permit_params do
  #   permitted = [:nombre, :precio, :descripcion, :stock_actual, :stock_total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :imagen, as: :file
    end
    f.actions
  end
end
