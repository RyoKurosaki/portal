class ApplyServicesController < ApplicationController
  before_action :authenticate_user!, :check_admin_user, except: [:show]
  before_action :set_apply_service, only: [:show, :destroy]

  # GET /apply_services
  # GET /apply_services.json
  def index
    @apply_services = ApplyService.all
  end

  # GET /apply_services/1
  # GET /apply_services/1.json
  def show
  end

  # POST /apply_services
  # POST /apply_services.json
  def create
    @apply_service = ApplyService.new(apply_service_params)

    respond_to do |format|
      if @apply_service.save
        format.html { redirect_to @apply_service, notice: 'your applying was successfully sent.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /apply_services/1
  # DELETE /apply_services/1.json
  def destroy
    @apply_service.destroy
    respond_to do |format|
      format.html { redirect_to apply_services_url, notice: 'Apply service was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_service
      @apply_service = ApplyService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_service_params
      params.require(:apply_service).permit(:name, :email, :tel, :activity_service_id, :expected_date)
    end
end
