class CreateReservas < ActiveRecord::Migration[6.0]
  def change
    create_table :reservas do |t|
      # t.string :usuario
      # t.string :producto
      t.string :descripcion
      t.datetime :fecha_inicio
      t.datetime :fecha_termino

      t.integer :aceptado, default: 0

      t.timestamps
    end
  end
end
