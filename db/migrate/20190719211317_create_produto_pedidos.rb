class CreateProdutoPedidos < ActiveRecord::Migration
  def change
    create_table :produto_pedidos do |t|
      t.string :nome
      t.float :valor_unitario
      t.integer :quantidade
      t.float :valor_total
      t.references :pedido, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
