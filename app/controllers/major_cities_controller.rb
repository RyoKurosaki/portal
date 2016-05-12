class MajorCitiesController < ApplicationController
  before_action :authenticate_user!, :check_admin_user, except: [:ajax]
  before_action :set_major_city, only: [:edit, :update, :destroy]

  def ajax
    prefecture = Prefecture.find(params[:prefecture_id])
    render json: prefecture.major_cities.select(:id, :name)
  end

  # GET /major_cities
  # GET /major_cities.json
  def index
    @major_cities = MajorCity.order("prefecture_id")
  end

  # GET /major_cities/new
  def new
    @major_city = MajorCity.new
  end

  # GET /major_cities/1/edit
  def edit
  end

  # POST /major_cities
  # POST /major_cities.json
  def create
    @major_city = MajorCity.new(major_city_params)

    respond_to do |format|
      if @major_city.save
        format.html { redirect_to @major_city, notice: 'Major city was successfully created.' }
        format.json { render :show, status: :created, location: @major_city }
      else
        format.html { render :new }
        format.json { render json: @major_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /major_cities/1
  # PATCH/PUT /major_cities/1.json
  def update
    respond_to do |format|
      if @major_city.update(major_city_params)
        format.html { redirect_to @major_city, notice: 'Major city was successfully updated.' }
        format.json { render :show, status: :ok, location: @major_city }
      else
        format.html { render :edit }
        format.json { render json: @major_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /major_cities/1
  # DELETE /major_cities/1.json
  def destroy
    @major_city.destroy
    respond_to do |format|
      format.html { redirect_to major_cities_url, notice: 'Major city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major_city
      @major_city = MajorCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def major_city_params
      params.require(:major_city).permit(:name, :prefecture_id)
    end
end
