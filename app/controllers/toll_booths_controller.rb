class TollBoothsController < ApplicationController
  before_action :set_toll_booth, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :load_travel
  
  # GET /toll_booths
  # GET /toll_booths.json
  
  def index
    #@toll_booths = Tollbooth.all
    @toll_booths = @travel.toll_booths.all
  end

  # GET /toll_booths/1
  # GET /toll_booths/1.json
  def show
    @toll_booths = @travel.toll_booths.find(params[:id])
  end

  # GET /toll_booths/new
  def new
    #@toll_booth = Tollbooth.new
    @toll_booth = @travel.toll_booths.new
  end

  # GET /toll_booths/1/edit
  def edit
    @toll_booths = @travel.toll_booths.find(params[:id])
  end

  # POST /toll_booths
  # POST /toll_booths.json
  def create
    #@toll_booth = Tollbooth.new(toll_booth_params)
    params.permit!
    @toll_booths = @travel.toll_booths.new(params[:toll_booth])
    respond_to do |format|
      if @toll_booths.save
        #format.html { redirect_to @toll_booth, notice: 'Toll booth was successfully created.' }
        format.html { redirect_to [@travel, @toll_booths], notice: 'Toll booth was successfully created.' }
        format.json { render :show, status: :created, location: @toll_booths }
      else
        format.html { render :new }
        format.json { render json: @toll_booths.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toll_booths/1
  # PATCH/PUT /toll_booths/1.json
  def update
    @toll_booth = @travel.toll_booths.find(params[:id])
    respond_to do |format|
      if @toll_booth.update(toll_booth_params)
        #format.html { redirect_to @toll_booth, notice: 'Toll booth was successfully updated.' }
        format.html { redirect_to [@travel, @toll_booth], notice: 'Toll booth was successfully updated.' }
        format.json { render :show, status: :ok, location: @toll_booth }
      else
        format.html { render :edit }
        format.json { render json: @toll_booth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toll_booths/1
  # DELETE /toll_booths/1.json
  def destroy
    @toll_booth = @travel.toll_booths.find(params[:id])
    @toll_booth.destroy
    respond_to do |format|
    #format.html { redirect_to toll_booths_url, notice: 'Toll booth was successfully destroyed.' }
      format.html { redirect_to travel_toll_booths_path(@travel) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_toll_booth
    @toll_booth = TollBooth.find(params[:id])
  end

  def load_travel
    @travel = Travel.find(params[:travel_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def toll_booth_params
    params.require(:toll_booth).permit(:travel_id, :date, :total)
  end
end
