class LaptopBrandsController < ApplicationController
  load_and_authorize_resource # run cancancan authorization before every method
  before_action :authenticate_user!
  before_action :set_laptop_brand, only: %i[show edit update destroy]

  # GET /laptop_brands
  # GET /laptop_brands.json
  # Eager load all Laptop Brand entries and send them to INDEX view
  def index
    @laptop_brands = LaptopBrand.with_attached_picture.all
  end

  # GET /laptop_brands/1
  # GET /laptop_brands/1.json
  def show; end

  # GET /laptop_brands/new
  # Create a new empty Laptop brand entry and send it to NEW view
  def new
    @laptop_brand = LaptopBrand.new
  end

  # GET /laptop_brands/1/edit
  def edit; end

  # POST /laptop_brands
  # POST /laptop_brands.json
  def create
    @laptop_brand = LaptopBrand.new(laptop_brand_params)

    # Check if newly created Laptop Brand was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @laptop_brand.save
        format.html { redirect_to @laptop_brand, notice: 'Laptop brand was successfully created.' }
        format.json { render :show, status: :created, location: @laptop_brand }
      else
        format.html { render :new }
        format.json { render json: @laptop_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptop_brands/1
  # PATCH/PUT /laptop_brands/1.json
  def update
    # Check if updated Laptop Brand was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @laptop_brand.update(laptop_brand_params)
        format.html { redirect_to @laptop_brand, notice: 'Laptop brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @laptop_brand }
      else
        format.html { render :edit }
        format.json { render json: @laptop_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptop_brands/1
  # DELETE /laptop_brands/1.json
  def destroy
    @laptop_brand.destroy
    respond_to do |format|
      format.html { redirect_to laptop_brands_url, notice: 'Laptop brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_laptop_brand
    @laptop_brand = LaptopBrand.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def laptop_brand_params
    params.require(:laptop_brand).permit(:picture, :name)
  end
end
