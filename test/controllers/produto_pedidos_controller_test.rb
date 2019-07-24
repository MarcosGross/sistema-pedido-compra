require 'test_helper'

class ProdutoPedidosControllerTest < ActionController::TestCase
  setup do
    @produto_pedido = produto_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produto_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produto_pedido" do
    assert_difference('ProdutoPedido.count') do
      post :create, produto_pedido: { nome: @produto_pedido.nome, quantidade: @produto_pedido.quantidade, valor_total: @produto_pedido.valor_total, valor_unitario: @produto_pedido.valor_unitario }
    end

    assert_redirected_to produto_pedido_path(assigns(:produto_pedido))
  end

  test "should show produto_pedido" do
    get :show, id: @produto_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produto_pedido
    assert_response :success
  end

  test "should update produto_pedido" do
    patch :update, id: @produto_pedido, produto_pedido: { nome: @produto_pedido.nome, quantidade: @produto_pedido.quantidade, valor_total: @produto_pedido.valor_total, valor_unitario: @produto_pedido.valor_unitario }
    assert_redirected_to produto_pedido_path(assigns(:produto_pedido))
  end

  test "should destroy produto_pedido" do
    assert_difference('ProdutoPedido.count', -1) do
      delete :destroy, id: @produto_pedido
    end

    assert_redirected_to produto_pedidos_path
  end
end
