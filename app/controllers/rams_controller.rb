class RamsController < ApplicationController
  load_and_authorize_resource # run cancancan authorization before every method  
  before_action :authenticate_user! 
  before_action :set_ram, only: [:show, :edit, :update, :destroy]

  # GET /rams
  # GET /rams.json
  # Get all RAM entries and send them to INDEX view  
  def index
    @rams = Ram.all
  end

  # GET /rams/1
  # GET /rams/1.json
  def show
  end

  # GET /rams/new
  # Create a new empty RAM entry and send it to NEW view  
  def new
    @ram = Ram.new
  end

  # GET /rams/1/edit
  def edit
  end

  # POST /rams
  # POST /rams.json
  def create
    @ram = Ram.new(ram_params)
    #Check if newly created RAM was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @ram.save
        format.html { redirect_to @ram, notice: 'Ram was successfully created.' }
        format.json { render :show, status: :created, location: @ram }
      else
        format.html { render :new }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rams/1
  # PATCH/PUT /rams/1.json
  def update
    #Check if updated RAM was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @ram.update(ram_params)
        format.html { redirect_to @ram, notice: 'Ram was successfully updated.' }
        format.json { render :show, status: :ok, location: @ram }
      else
        format.html { render :edit }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rams/1
  # DELETE /rams/1.json
  def destroy
    @ram.destroy
    respond_to do |format|
      format.html { redirect_to rams_url, notice: 'Ram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ram
      @ram = Ram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ram_params
      params.require(:ram).permit(:name)
    end
end
