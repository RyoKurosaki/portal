class MajorCitiesController < ApplicationController
  def index
    prefecture = Prefecture.find(params[:prefecture_id])
    render json: prefecture.major_cities.select(:id, :name)
  end
end
