class Pedido < ActiveRecord::Base
  belongs_to :fornecedor
  has_many :produto_pedido
end
