class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  def index
    @estates = Estate.all
  end

  def show
    @estate = Estate.find(params[:id])
    @stations = @estate.stations
  end

  def new
    @estate = Estate.new
    2.times {@estate.stations.build}
  end

  def edit
    @estate = Estate.find(params[:id])
  end

  # POST /estates or /estates.json
  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      flash[:notice] = "登録が完了しました！"
      redirect_to estate_path(@estate.id)
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @estate.update(estate_params)
        format.html { redirect_to @estate, notice: "Estate was successfully updated." }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: "情報を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
  def set_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:name, :price, :adress, :year, :content, stations_attributes: [:route, :station_name, :walk, :estate_id])
  end
end
