class LaptopOrdersController < ApplicationController
  before_action :set_laptop_order, only: [:show, :edit, :update, :destroy]

  # GET /laptop_orders
  # GET /laptop_orders.json
  def index
    @laptop_orders = LaptopOrder.all
  end

  # GET /laptop_orders/1
  # GET /laptop_orders/1.json
  def show
  end

  # GET /laptop_orders/new
  def new
    @laptop_order = LaptopOrder.new
  end

  # GET /laptop_orders/1/edit
  def edit
  end

  # POST /laptop_orders
  # POST /laptop_orders.json
  def create
    @laptop_order = LaptopOrder.new(laptop_order_params)

    respond_to do |format|
      if @laptop_order.save
        format.html { redirect_to @laptop_order, notice: 'Laptop order was successfully created.' }
        format.json { render :show, status: :created, location: @laptop_order }
      else
        format.html { render :new }
        format.json { render json: @laptop_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptop_orders/1
  # PATCH/PUT /laptop_orders/1.json
  def update
    respond_to do |format|
      if @laptop_order.update(laptop_order_params)
        format.html { redirect_to @laptop_order, notice: 'Laptop order was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptop_order }
      else
        format.html { render :edit }
        format.json { render json: @laptop_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptop_orders/1
  # DELETE /laptop_orders/1.json
  def destroy
    @laptop_order.destroy
    respond_to do |format|
      format.html { redirect_to laptop_orders_url, notice: 'Laptop order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop_order
      @laptop_order = LaptopOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laptop_order_params
      params.require(:laptop_order).permit(:user_id, :laptop_id)
    end
end
