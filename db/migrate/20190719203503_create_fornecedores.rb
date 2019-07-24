class CreateFornecedores < ActiveRecord::Migration
  def change
    create_table :fornecedores do |t|
      t.string :nome
      t.string :email

      t.timestamps null: false
    end
  end
end
