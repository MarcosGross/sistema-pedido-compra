class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :preco
      t.references :fornecedor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
