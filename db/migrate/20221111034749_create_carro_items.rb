class CreateCarroItems < ActiveRecord::Migration[6.0]
  def change
    create_table :carro_items do |t|
      t.integer :cantidad


      t.timestamps
    end
    
    add_reference :carro_items, :producto, null: false, foreign_key: true
    add_reference :carro_items, :carro, optional: true, foreign_key: true
    add_reference :carro_items, :reserva, optional: true, foreign_key: true
  end
end
