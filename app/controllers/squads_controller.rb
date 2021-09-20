class SquadsController < ApplicationController
  before_action :set_mission
  before_action :set_squad, only: %i[ show edit update destroy ]

  # GET /missions/:mission_id/squads or /missions/:mission_id/squads.json
  def index
    @squads = @mission.squads
  end

  # GET /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def show
  end

  # GET /missions/:mission_id/squads/new
  def new
    @squad = @mission.squads.build
  end

  # GET /missions/:mission_id/squads/1/edit
  def edit
  end

  # POST /missions/:mission_id/squads or /missions/:mission_id/squads.json
  def create
    @squad = @mission.squads.build(squad_params)

    respond_to do |format|
      if @squad.save
        format.html { redirect_to [@mission, @squad], notice: "Squad was successfully created." }
        format.json { render :show, status: :created, location: [@mission, @squad] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def update
    respond_to do |format|
      if @squad.update(squad_params)
        format.html { redirect_to [@mission, @squad], notice: "Squad was successfully updated." }
        format.json { render :show, status: :ok, location: [@mission, @squad] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @squad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def destroy
    @squad.destroy
    respond_to do |format|
      format.html { redirect_to mission_squads_url(@mission), notice: "Squad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:mission_id])
    end

    def set_squad
      @squad = @mission.squads.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def squad_params
      params.require(:squad).permit(
        :name,
        :leader_id,
        crew_ids: []
      )
    end
end
