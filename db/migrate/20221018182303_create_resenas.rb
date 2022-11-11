class CreateResenas < ActiveRecord::Migration[6.0]
  def change
    create_table :resenas do |t|
      t.float :calificacion
      t.string :contenido

      t.timestamps
    end
  end
end
