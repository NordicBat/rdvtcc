class TollBothsController < ApplicationController
  before_action :set_toll_both, only: [:show, :edit, :update, :destroy]

  # GET /toll_boths
  # GET /toll_boths.json
  def index
    @toll_boths = TollBoth.all
  end

  # GET /toll_boths/1
  # GET /toll_boths/1.json
  def show
  end

  # GET /toll_boths/new
  def new
    @toll_both = TollBoth.new
  end

  # GET /toll_boths/1/edit
  def edit
  end

  # POST /toll_boths
  # POST /toll_boths.json
  def create
    @toll_both = TollBoth.new(toll_both_params)

    respond_to do |format|
      if @toll_both.save
        format.html { redirect_to @toll_both, notice: 'Toll both was successfully created.' }
        format.json { render :show, status: :created, location: @toll_both }
      else
        format.html { render :new }
        format.json { render json: @toll_both.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toll_boths/1
  # PATCH/PUT /toll_boths/1.json
  def update
    respond_to do |format|
      if @toll_both.update(toll_both_params)
        format.html { redirect_to @toll_both, notice: 'Toll both was successfully updated.' }
        format.json { render :show, status: :ok, location: @toll_both }
      else
        format.html { render :edit }
        format.json { render json: @toll_both.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toll_boths/1
  # DELETE /toll_boths/1.json
  def destroy
    @toll_both.destroy
    respond_to do |format|
      format.html { redirect_to toll_boths_url, notice: 'Toll both was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toll_both
      @toll_both = TollBoth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toll_both_params
      params.require(:toll_both).permit(:travel_id, :date, :total)
    end
end
