class LaptopOrdersController < ApplicationController
  load_and_authorize_resource # run cancancan authorization before every method  
  before_action :authenticate_user!
  before_action :set_laptop_order, only: [:show, :edit, :update, :destroy]

  # GET /laptop_orders
  # GET /laptop_orders.json
  # Get all Laptop Order entries and send them to INDEX view  
  def index
    @laptop_orders = LaptopOrder.all
  end

  # GET /laptop_orders/1
  # GET /laptop_orders/1.json
  def show
  end

  # GET /laptop_orders/new
  # Create a new empty Laptop Order entry and send it to NEW view 
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
    #Check if newly created Laptop Order was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @laptop_order.save
        Laptop.find(laptop_order_params[:laptop_id]).update(
          sold_status: "true"
        )
        format.html { redirect_to Laptop, notice: 'Laptop order was successfully created.' }
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
    #Check if updated Laptop Order was saved in database, if it was flash a success message, if not flash a error message
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
      params.permit(:user_id, :laptop_id)
    end
end
