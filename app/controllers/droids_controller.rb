class DroidsController < ApplicationController
  before_action :set_droid, only: %i[ show edit update destroy ]

  # GET /droids or /droids.json
  def index
    @droids = Droid.all
  end

  # GET /droids/1 or /droids/1.json
  def show
  end

  # GET /droids/new
  def new
    @droid = Droid.new
  end

  # GET /droids/1/edit
  def edit
  end

  # POST /droids or /droids.json
  def create
    @droid = Droid.new(droid_params)

    respond_to do |format|
      if @droid.save
        format.html { redirect_to @droid, notice: "Droid was successfully created." }
        format.json { render :show, status: :created, location: @droid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @droid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /droids/1 or /droids/1.json
  def update
    respond_to do |format|
      if @droid.update(droid_params)
        format.html { redirect_to @droid, notice: "Droid was successfully updated." }
        format.json { render :show, status: :ok, location: @droid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @droid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /droids/1 or /droids/1.json
  def destroy
    @droid.destroy
    respond_to do |format|
      format.html { redirect_to droids_url, notice: "Droid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_droid
      @droid = Droid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def droid_params
      params.require(:droid).permit(:name, :model, :features)
    end
end
