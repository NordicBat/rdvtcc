class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :load_travel
  # GET /meals
  # GET /meals.json
  def index
    #@meals = Meal.all
    @meals = @travel.meals.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = @travel.meals.find(params[:id])
  end

  # GET /meals/new
  def new
    #@meal = Meal.new
    @meal = @travel.meals.new
  end

  # GET /meals/1/edit
  def edit
    @meal = @travel.meals.find(params[:id])
    @users= User.all
    authorize @users
  end

  # POST /meals
  # POST /meals.json
  def create
    #@meal = Meal.new(meal_params)
    params.permit!
    @meal = @travel.meals.new(params[:meal])
    respond_to do |format|
      if @meal.save
        #format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.html { redirect_to [@travel, @meal], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    @meal = @travel.meals.find(params[:id])

    respond_to do |format|
      if @meal.update(meal_params)
        #format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.html { redirect_to [@travel, @meal], notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = @travel.meals.find(params[:id])
    @meal.destroy
    @users= User.all
    authorize @users
    respond_to do |format|
    #format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.html { redirect_to travel_meals_path(@travel) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  def load_travel
    @travel = Travel.find(params[:travel_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meal_params
    params.require(:meal).permit(:travel_id, :date, :kind, :total)
  end
end
