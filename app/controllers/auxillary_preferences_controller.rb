class AuxillaryPreferencesController < ApplicationController
  before_action :set_auxillary_preference, only: [:show, :edit, :update, :destroy]

  # GET /auxillary_preferences
  # GET /auxillary_preferences.json
  def index
    @auxillary_preferences = AuxillaryPreference.all
  end

  # GET /auxillary_preferences/1
  # GET /auxillary_preferences/1.json
  def show
  end

  # GET /auxillary_preferences/new
  def new
    @auxillary_preference = AuxillaryPreference.new
  end

  # GET /auxillary_preferences/1/edit
  def edit
  end

  # POST /auxillary_preferences
  # POST /auxillary_preferences.json
  def create
    @auxillary_preference = AuxillaryPreference.new(auxillary_preference_params)

    respond_to do |format|
      if @auxillary_preference.save
        format.html { redirect_to @auxillary_preference, notice: 'Auxillary preference was successfully created.' }
        format.json { render :show, status: :created, location: @auxillary_preference }
      else
        format.html { render :new }
        format.json { render json: @auxillary_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auxillary_preferences/1
  # PATCH/PUT /auxillary_preferences/1.json
  def update
    respond_to do |format|
      if @auxillary_preference.update(auxillary_preference_params)
        format.html { redirect_to @auxillary_preference, notice: 'Auxillary preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @auxillary_preference }
      else
        format.html { render :edit }
        format.json { render json: @auxillary_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auxillary_preferences/1
  # DELETE /auxillary_preferences/1.json
  def destroy
    @auxillary_preference.destroy
    respond_to do |format|
      format.html { redirect_to auxillary_preferences_url, notice: 'Auxillary preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auxillary_preference
      @auxillary_preference = AuxillaryPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auxillary_preference_params
      params.require(:auxillary_preference).permit(:first_item_id, :second_item_id, :rank)
    end
end
