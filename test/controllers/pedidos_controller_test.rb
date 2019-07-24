require 'test_helper'

class PedidosControllerTest < ActionController::TestCase
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post :create, pedido: { data_hora_envio: @pedido.data_hora_envio, data_hora_recebimento: @pedido.data_hora_recebimento, data_pedido: @pedido.data_pedido, nome_fornecedor: @pedido.nome_fornecedor, quantidade_itens: @pedido.quantidade_itens, status_pedido: @pedido.status_pedido, valor_pedido: @pedido.valor_pedido }
    end

    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should show pedido" do
    get :show, id: @pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pedido
    assert_response :success
  end

  test "should update pedido" do
    patch :update, id: @pedido, pedido: { data_hora_envio: @pedido.data_hora_envio, data_hora_recebimento: @pedido.data_hora_recebimento, data_pedido: @pedido.data_pedido, nome_fornecedor: @pedido.nome_fornecedor, quantidade_itens: @pedido.quantidade_itens, status_pedido: @pedido.status_pedido, valor_pedido: @pedido.valor_pedido }
    assert_redirected_to pedido_path(assigns(:pedido))
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete :destroy, id: @pedido
    end

    assert_redirected_to pedidos_path
  end
end
