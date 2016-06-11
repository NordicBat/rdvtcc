class FuelsController < ApplicationController
  before_action :set_fuel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :load_travel
  # GET /fuels
  # GET /fuels.json
  def index
    #@fuels = Fuel.all
    @fuels = @travel.fuels.all
  end

  # GET /fuels/1
  # GET /fuels/1.json
  def show
    @fuel = @travel.fuels.find(params[:id])
  end

  # GET /fuels/new
  def new
    #@fuel = Fuel.new
    @fuel = @travel.fuels.new
  end

  # GET /fuels/1/edit
  def edit
    @fuel = @travel.fuels.find(params[:id])
    @users= User.all
    authorize @users
  end

  # POST /fuels
  # POST /fuels.json
  def create
    params.permit!
    @fuel = @travel.fuels.new(params[:fuel])

    respond_to do |format|
      if @fuel.save
        #format.html { redirect_to @fuel, notice: 'Fuel was successfully created.' }
        format.html { redirect_to [@travel, @fuel], notice: 'Fuel was successfully created.' }
        format.json { render :show, status: :created, location: @fuel }
      else
        format.html { render :new }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuels/1
  # PATCH/PUT /fuels/1.json
  def update
    @fuel = @travel.fuels.find(params[:id])
    respond_to do |format|
      if @fuel.update(fuel_params)
        #format.html { redirect_to @fuel, notice: 'Fuel was successfully updated.' }
        format.html { redirect_to [@travel, @fuel], notice: 'Fuel was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuel }
      else
        format.html { render :edit }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuels/1
  # DELETE /fuels/1.json
  def destroy
    @users= User.all
    authorize @users
    @fuel = @travel.fuels.find(params[:id])
    @fuel.destroy

    respond_to do |format|
    #format.html { redirect_to fuels_url, notice: 'Fuel was successfully destroyed.' }
      format.html { redirect_to travel_fuels_path(@travel) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fuel
    @fuel = Fuel.find(params[:id])
  end

  def load_travel
    @travel = Travel.find(params[:travel_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fuel_params
    params.require(:fuel).permit(:travel_id, :date, :total)
  end
end
