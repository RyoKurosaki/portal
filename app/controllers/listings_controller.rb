class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.where("host_email = ?", current_user.email)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @user = User.find_by_email(@listing.host_email)
    @activity_service = ActivityService.new
    @major_cities = MajorCity.none
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.host_email = current_user.email
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    foldernames = []
    if listing_params.has_key?('photo') && @listing.photo.present?
      foldernames.push(@listing.photo.match(/uploads.*/)[0])
    end
    if listing_params.has_key?('manual') && @listing.manual.present?
      foldernames.push(@listing.manual.match(/uploads.*/)[0])
    end
    if listing_params.has_key?('map') && @listing.map.present?
      foldernames.push(@listing.map.match(/uploads.*/)[0])
    end
    foldernames.each {|foldername|
      S3_BUCKET.delete_objects(delete: {objects: [key: foldername]})
    }
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    foldernames = []
    unless @listing.photo.blank?
      foldernames.push(@listing.photo.match(/uploads.*/)[0])
    end
    unless @listing.manual.blank?
      foldernames.push(@listing.manual.match(/uploads.*/)[0])
    end
    unless @listing.map.blank?
      foldernames.push(@listing.map.match(/uploads.*/)[0])
    end

    foldernames.each {|foldername|
      S3_BUCKET.delete_objects(delete: {objects: [key: foldername]})
    }

    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :address, :address_en, :photo, :manual, :map)
    end
end
