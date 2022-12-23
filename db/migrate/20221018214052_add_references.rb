class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :resenas, :usuario, null: false, foreign_key: true
    add_reference :resenas, :producto, null: false, foreign_key: true
    add_reference :reservas, :usuario, null: false, foreign_key: true
  end
end
