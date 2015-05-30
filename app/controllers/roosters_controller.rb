class RoostersController < ApplicationController
  before_action :set_rooster, only: [:show, :edit, :update, :destroy]

  # GET /roosters
  # GET /roosters.json
  def index
    @roosters = Rooster.all
    item_id = @roosters.pluck(:item_id)
    @item_name_hash = Item.where(:item_id => item_id).index_by(&:item_id)
  end

  # GET /roosters/1
  # GET /roosters/1.json
  def show
  end

  # GET /roosters/new
  def new
    @rooster = Rooster.new
  end

  # GET /roosters/1/edit
  def edit
  end

  # POST /roosters
  # POST /roosters.json
  def create
    @rooster = Rooster.new(rooster_params)

    respond_to do |format|
      if @rooster.save
        format.html { redirect_to @rooster, notice: 'Rooster was successfully created.' }
        format.json { render :show, status: :created, location: @rooster }
      else
        format.html { render :new }
        format.json { render json: @rooster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roosters/1
  # PATCH/PUT /roosters/1.json
  def update
    respond_to do |format|
      if @rooster.update(rooster_params)
        format.html { redirect_to @rooster, notice: 'Rooster was successfully updated.' }
        format.json { render :show, status: :ok, location: @rooster }
      else
        format.html { render :edit }
        format.json { render json: @rooster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roosters/1
  # DELETE /roosters/1.json
  def destroy
    @rooster.destroy
    respond_to do |format|
      format.html { redirect_to roosters_url, notice: 'Rooster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rooster
      @rooster = Rooster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rooster_params
      params.require(:rooster).permit(:item_id, :number_of_orders, :ttl)
    end
end
