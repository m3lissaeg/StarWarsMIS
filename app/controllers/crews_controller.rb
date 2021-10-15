class CrewsController < ApplicationController
  before_action :set_mission
  before_action :set_squad
  before_action :set_crew, only: %i[ show edit update destroy ]

  # GET /missions/:mission_id/squads/:squads_id/crews or /missions/:mission_id/squads/:squads_id/crews.json
  def index
    if @squad.nil?
      redirect_to controller: :static_pages, action: :error404 
    else
      @crews = @squad.crews
    end
  end

  # GET /missions/:mission_id/squads/:squads_id/crews/1 or /missions/:mission_id/squads/:squads_id/crews/1.json
  def show
    redirect_to controller: :static_pages, action: :error404 unless current_user && 
    (current_user.admin || @crew.id.in?(@squad.crews.ids) )
  end

  # GET /missions/:mission_id/squads/:squads_id/crews/new
  def new
    puts(@squad.nil?)
    @crew = @squad.crews.build
  end

  # GET /missions/:mission_id/squads/:squads_id/crews/1/edit
  def edit
  end

  # POST /missions/:mission_id/squads/:squads_id/crews or /missions/:mission_id/squads/:squads_id/crews.json
  def create
    @crew = @squad.crews.build(crew_params)

    respond_to do |format|
      if @crew.save
        # puts params.inspect
        format.html { redirect_to [@mission, @squad, @crew], notice: "Crew was successfully created." }
        format.json { render :show, status: :created, location: [@mission, @squad, @crew] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/:mission_id/squads/:squads_id/crews/1 or /missions/:mission_id/squads/:squads_id/crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to [@mission, @squad, @crew], notice: "Crew was successfully updated." }
        format.json { render :show, status: :ok, location: [@mission, @squad, @crew] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/:mission_id/squads/:squads_id/crews/1 or /missions/:mission_id/squads/:squads_id/crews/1.json
  def destroy
    @crew.destroy
    respond_to do |format|
      format.html { redirect_to mission_squad_crews_url(@mission, @squad), notice: "Crew was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      if params[:mission_id].to_i.in?(current_user.missions.ids) || current_user.admin?
        @mission = Mission.find_by(id: params[:mission_id])
        redirect_to controller: :static_pages, action: :error404 if @mission.nil?
      end
    end
  
    def set_squad
      if @mission.nil? 
        redirect_to controller: :static_pages, action: :error404 
      else
        @squad = @mission.squads.find_by(id: params[:squad_id])
      end
    end
    
    def set_crew
      if @squad.nil? 
        redirect_to controller: :static_pages, action: :error404 if @crew.nil?
      else
        @crew = @squad.crews.find_by(id: params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def crew_params
      params.require(:crew).permit(
        :name,
        :ship_id,
        droid_ids: [],
        rebel_ids: [],
        passenger_ids: []
      )
    end
end
