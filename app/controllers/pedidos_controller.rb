class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy, :alterar_status]
  before_action :authenticate_admin_user!

  

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
    @q = Pedido.ransack(params[:q])
    @pedidos = @q.result(distinct: true)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def alterar_status
    @pedido.status_pedido=params[:status]
    @pedido.save
    respond_to do |format|
      
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
     
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:data_pedido, :fornecedor_id, :quantidade_itens, :status_pedido, :valor_pedido, :data_hora_envio, :data_hora_recebimento)
    end
end
