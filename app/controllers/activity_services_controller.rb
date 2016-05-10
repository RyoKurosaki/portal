class ActivityServicesController < ApplicationController
  before_action :authenticate_user!, :check_admin_user
  before_action :set_activity_service, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /activity_services
  # GET /activity_services.json
  def index
    @activity_services = ActivityService.all
  end

  # GET /activity_services/1
  # GET /activity_services/1.json
  def show
  end

  # GET /activity_services/new
  def new
    @activity_service = ActivityService.new
    @major_cities = MajorCity.none
  end

  # GET /activity_services/1/edit
  def edit
  end

  # POST /activity_services
  # POST /activity_services.json
  def create
    @activity_service = ActivityService.new(activity_service_params)

    respond_to do |format|
      if @activity_service.save
        format.html { redirect_to @activity_service, notice: 'Activity service was successfully created.' }
        format.json { render :show, status: :created, location: @activity_service }
      else
        format.html { render :new }
        format.json { render json: @activity_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_services/1
  # PATCH/PUT /activity_services/1.json
  def update
    respond_to do |format|
      if @activity_service.update(activity_service_params)
        format.html { redirect_to @activity_service, notice: 'Activity service was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_service }
      else
        format.html { render :edit }
        format.json { render json: @activity_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_services/1
  # DELETE /activity_services/1.json
  def destroy
    @activity_service.destroy
    respond_to do |format|
      format.html { redirect_to activity_services_url, notice: 'Activity service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajax
    category = Category.find(params[:id])
    render json: category.activity_services.select(:id, :name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_service
      @activity_service = ActivityService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_service_params
      params.require(:activity_service).permit(:name, :category_id, :detail, :photo, :amount, :prefecture_id, :major_city_id)
    end
end
