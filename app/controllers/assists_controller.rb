class AssistsController < ApplicationController
  before_action :set_assist, only: [:show, :edit, :update, :destroy]

  # GET /assists
  # GET /assists.json
  def index
    @assists = Assist.all
  end

  # GET /assists/1
  # GET /assists/1.json
  def show
  end

  # GET /assists/new
  def new
    @assist = Assist.new
    @assist.game_id = params[:game_id]
  end

  # GET /assists/1/edit
  def edit
  end

  # POST /assists
  # POST /assists.json
  def create
    @assist = Assist.new(assist_params)

    @assist.save
    player = Player.find_by_id(@assist.player_id)
    player.assists += 1
    owns = Ownership.where('player_id = ?',player.id)
    owns.each do |own|
      user = User.find(own.user_id)
      points = user.points + 1
      user.update_column(:points, points)
    end
    player.save

    respond_to do |format|
      if @assist.save
        format.html { redirect_to @assist, notice: 'Assist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assist }
        format.js { redirect_to game_path(@assist.game_id), notice: 'Assist was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @assist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assists/1
  # PATCH/PUT /assists/1.json
  def update
    respond_to do |format|
      if @assist.update(assist_params)
        format.html { redirect_to @assist, notice: 'Assist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assists/1
  # DELETE /assists/1.json
  def destroy
    @assist.destroy
    respond_to do |format|
      format.html { redirect_to assists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assist
      @assist = Assist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assist_params
      params.require(:assist).permit(:game_id, :aTime, :player_id)
    end
end
