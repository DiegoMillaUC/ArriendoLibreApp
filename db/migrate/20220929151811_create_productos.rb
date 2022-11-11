class CreateProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :precio
      t.string :descripcion
      t.integer :stock_actual
      t.integer :stock_total

      t.boolean :disponible, default: true
      t.string :categoria

      t.timestamps
    end
  end
end
