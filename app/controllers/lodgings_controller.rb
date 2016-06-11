class LodgingsController < ApplicationController
  before_action :set_lodging, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :load_travel
  # GET /lodgings
  # GET /lodgings.json
  def index
    #@lodgings = Lodging.all
    @lodgings = @travel.lodgings.all
  end

  # GET /lodgings/1
  # GET /lodgings/1.json
  def show
    @lodging = @travel.lodgings.find(params[:id])
  end

  # GET /lodgings/new
  def new
    #@lodging = Lodging.new
    @lodging = @travel.lodgings.new
  end

  # GET /lodgings/1/edit
  def edit
    @lodging = @travel.lodgings.find(params[:id])
    @users= User.all
    authorize @users

  end

  # POST /lodgings
  # POST /lodgings.json
  def create
    #@lodging = Lodging.new(lodging_params)
    params.permit!
    @lodging = @travel.lodgings.new(params[:lodging])

    respond_to do |format|
      if @lodging.save
        #format.html { redirect_to @lodging, notice: 'Lodging was successfully created.' }
        format.html { redirect_to [@travel, @lodging], notice: 'Lodging was successfully created.' }
        format.json { render :show, status: :created, location: @lodging }
      else
        format.html { render :new }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lodgings/1
  # PATCH/PUT /lodgings/1.json
  def update
    @lodging = @travel.lodgings.find(params[:id])
    respond_to do |format|
      if @lodging.update(lodging_params)
        #format.html { redirect_to @lodging, notice: 'Lodging was successfully updated.' }
        format.html { redirect_to [@travel, @lodging], notice: 'Lodging was successfully updated.' }
        format.json { render :show, status: :ok, location: @lodging }
      else
        format.html { render :edit }
        format.json { render json: @lodging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lodgings/1
  # DELETE /lodgings/1.json
  def destroy
    @lodging = @travel.lodgings.find(params[:id])
    @lodging.destroy
    @users= User.all
    authorize @users
    respond_to do |format|
    #format.html { redirect_to lodgings_url, notice: 'Lodging was successfully destroyed.' }
      format.html { redirect_to travel_lodgings_path(@travel),notice: 'Lodging was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lodging
    @lodging = Lodging.find(params[:id])
  end

  def load_travel
    @travel = Travel.find(params[:travel_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lodging_params
    params.require(:lodging).permit(:travel_id, :date, :hotelName, :hotelPhone, :total)
  end
end
