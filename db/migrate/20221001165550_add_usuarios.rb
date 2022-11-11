class AddUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :telefono, :string
  end
end
