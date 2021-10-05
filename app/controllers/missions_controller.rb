class MissionsController < ApplicationController
  before_action :set_mission, only: %i[ show edit update destroy ]

  # GET /missions or /missions.json
  def index
    if current_user.admin?
      @missions = Mission.all
    else
      @missions = current_user.missions
    end
  end

  # GET /missions/1 or /missions/1.json
  def show
    redirect_to controller: :static_pages, action: :error404 unless current_user && 
    (current_user.admin || @mission.commander == current_user )
  end

  # GET /missions/new
  def new
    @mission = Mission.new
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions or /missions.json
  def create
    if current_user.admin?
      @mission = Mission.new(mission_params)

      respond_to do |format|
        if @mission.save
          format.html { redirect_to @mission, notice: "Mission was successfully created." }
          format.json { render :show, status: :created, location: @mission }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @mission.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /missions/1 or /missions/1.json
  def update
    if current_user.admin?
      respond_to do |format|
        if @mission.update(mission_params)
          format.html { redirect_to @mission, notice: "Mission was successfully updated." }
          format.json { render :show, status: :ok, location: @mission }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @mission.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /missions/1 or /missions/1.json
  def destroy
    if current_user.admin?
      @mission.destroy
      respond_to do |format|
        format.html { redirect_to missions_url, notice: "Mission was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find_by(id: params[:id])
      redirect_to controller: :static_pages, action: :error404 if @mission.nil?
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.require(:mission).permit(
        :start_date,
        :end_date,
        :details,
        :status,
        :commander_id,
        :location_id
      )
    end
end
