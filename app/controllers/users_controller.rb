class UsersController < ApplicationController
  load_and_authorize_resource # run cancancan authorization before every method  
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /users
  # GET /users.json

  def index
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # # get an array of IDs for all laptops the current user has purchased   
    # arr = current_user.laptop_orders.pluck(:laptop_id)
    # # from the above array of IDs find all laptops that match those IDs and send to show view 
    # @purchased_laptops = Laptop.find(arr)

    # # If the user is a seller get all laptops they have listed and send to show view
    # if current_user.seller == "true"
    #   arr = current_user.laptops.pluck(:id)
    #   @listings = Laptop.find(arr)
    # end

    # get array of ids for all laptops a user has purchased
    arr = current_user.laptop_orders.pluck(:laptop_id)
    columns =  [:user, :laptop_brand, :grade, :cpu, :ram, :hard_drive]

    # Eager load all purchased laptops (using above array) for current user
    @purchased_laptops = Laptop.where(id: arr).order("model").includes(columns).with_attached_picture

    # Eager load all laptops a user (seller) owns
    if current_user.seller == "true"

      @listings = Laptop.where(user_id: current_user.id).includes(columns).with_attached_picture
      
    end

  end

  # GET /users/new
  # Create a new empty USER entry and send it to NEW view  
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    #Check if newly created USER was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @user.save
        puts "----------------------------------success"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        puts "----------------------------------errors"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #Check if updated USER was saved in database, if it was flash a success message, if not flash a error message
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin, :seller)
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
