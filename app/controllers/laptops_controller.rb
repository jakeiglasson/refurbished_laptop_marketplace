class LaptopsController < ApplicationController
  load_and_authorize_resource # run cancancan authorization before every method  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_laptop, only: [:show, :edit, :update, :destroy]

  # GET /laptops
  # GET /laptops.json
  # Get all Laptop entries and send them to INDEX view  
  def index
    # eager load all laptops
    laptops = Laptop.order("model").includes(:user, :laptop_brand, :grade, :cpu, :ram, :hard_drive).with_attached_picture

    # Get all laptops that ARENT sold and send them to index
    @unsold_laptops = laptops.where(sold_status: "false")

    # Get all laptops the ARE sold and send them to index
    @sold_laptops = laptops.where(sold_status: "true")
  end

  # GET /laptops/1
  # GET /laptops/1.json
  def show

  end

  # GET /laptops/new
  # Create a new empty Laptop entry and send it to NEW view  
  def new
    @laptop = Laptop.new
    # authorize! :create, @laptop
  end

  # GET /laptops/1/edit
  def edit
  end

  # POST /laptops
  # POST /laptops.json
  
  def create
    @laptop = Laptop.new(laptop_params)
    @laptop.user_id = current_user.id
    #Check if newly created Laptop was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @laptop.save
        format.html { redirect_to @laptop, notice: 'Laptop was successfully created.' }
        format.json { render :show, status: :created, location: @laptop }
      else
        format.html { render :new }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptops/1
  # PATCH/PUT /laptops/1.json
  def update
    #Check if updated Laptop was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @laptop.update(laptop_params)
        format.html { redirect_to @laptop, notice: 'Laptop was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptop }
      else
        format.html { render :edit }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1
  # DELETE /laptops/1.json
  def destroy
    @laptop.destroy
    respond_to do |format|
      format.html { redirect_to laptops_url, notice: 'Laptop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop
      @laptop = Laptop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laptop_params
      params.require(:laptop).permit(:user_id, :laptop_brand_id, :grade_id, :Laptop_id, :ram_id, :cpu_id, :hard_drive_id, :model, :price, :sold_status, :picture)
    end
end
