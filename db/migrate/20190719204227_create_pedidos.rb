class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.date :data_pedido
      t.integer :quantidade_itens, default: 0
      t.string :status_pedido
      t.float :valor_pedido, default: 0
      t.date :data_hora_envio
      t.date :data_hora_recebimento
      t.references :fornecedor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
