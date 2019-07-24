json.extract! produto_pedido, :id, :nome, :valor_unitario, :quantidade, :valor_total, :created_at, :updated_at
json.url produto_pedido_url(produto_pedido, format: :json)
