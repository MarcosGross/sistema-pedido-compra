json.extract! pedido, :id, :data_pedido, :nome_fornecedor, :quantidade_itens, :status_pedido, :valor_pedido, :data_hora_envio, :data_hora_recebimento, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
