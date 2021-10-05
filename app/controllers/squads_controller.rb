class SquadsController < ApplicationController
  before_action :set_mission
  before_action :set_squad, only: %i[ show edit update destroy ]

  # GET /missions/:mission_id/squads or /missions/:mission_id/squads.json
  def index
    if @mission.nil?
      redirect_to controller: :static_pages, action: :error404 
    else
      @squads = @mission.squads
    end
  end

  # GET /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def show
    redirect_to controller: :static_pages, action: :error404 unless current_user && 
    (current_user.admin || @squad.id.in?(@mission.squads.ids) )
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
    if current_user.admin?
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
  end

  # PATCH/PUT /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def update
    if current_user.admin?
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
  end

  # DELETE /missions/:mission_id/squads/1 or /missions/:mission_id/squads/1.json
  def destroy
    if current_user.admin?
      @squad.destroy
      respond_to do |format|
        format.html { redirect_to mission_squads_url(@mission), notice: "Squad was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      # if params[:mission_id].in?(current_user.missions.ids) || current_user.admin?
        @mission = Mission.find_by(id: params[:mission_id])
        redirect_to controller: :static_pages, action: :error404 if @mission.nil?
      # end
    end

    def set_squad
      @squad = @mission.squads.find_by(id: params[:id])
      redirect_to controller: :static_pages, action: :error404 if @squad.nil?
    end

    # Only allow a list of trusted parameters through.
    def squad_params
      params.require(:squad).permit(
        :name,
        :leader_id        
      )
    end
end
