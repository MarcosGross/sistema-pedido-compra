class ProdutoPedidosController < ApplicationController
  before_action :set_produto_pedido, only: [:show, :edit, :update, :destroy]
  before_action :set_pedido

  # GET /produto_pedidos
  # GET /produto_pedidos.json
  def index
    @produto_pedidos = ProdutoPedido.all
  end

  # GET /produto_pedidos/1
  # GET /produto_pedidos/1.json
  def show
  end

  # GET /produto_pedidos/new
  def new
    @produto_pedido = ProdutoPedido.new
  end

  # GET /produto_pedidos/1/edit
  def edit
  end

  # POST /produto_pedidos
  # POST /produto_pedidos.json
  def create
    @produto_pedido = ProdutoPedido.new(produto_pedido_params)
    @produto_pedido.valor_unitario = Produto.find_by(nome: params[:produto_pedido][:nome]).preco
    @produto_pedido.valor_total = @produto_pedido.valor_unitario * Integer(params[:produto_pedido][:quantidade])

    respond_to do |format|
      if @produto_pedido.save
        @pedido.quantidade_itens += @produto_pedido.quantidade
        @pedido.valor_pedido += @produto_pedido.valor_total
        @pedido.save
        format.html { redirect_to @pedido, notice: 'Produto pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @produto_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produto_pedidos/1
  # PATCH/PUT /produto_pedidos/1.json
  def update
    respond_to do |format|
      if @produto_pedido.update(produto_pedido_params)
        format.html { redirect_to @produto_pedido, notice: 'Produto pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto_pedido }
      else
        format.html { render :edit }
        format.json { render json: @produto_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produto_pedidos/1
  # DELETE /produto_pedidos/1.json
  def destroy
    @pedido.quantidade_itens -= @produto_pedido.quantidade
    @pedido.valor_pedido += @produto_pedido.valor_total
    @pedido.save
    @produto_pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedido_url(@pedido), notice: 'Produto pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:pedido_id])
    end
    def set_produto_pedido
      @produto_pedido = ProdutoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_pedido_params
      params.require(:produto_pedido).permit(:nome, :valor_unitario, :quantidade, :valor_total, :pedido_id)
    end
end
