class SavesController < ApplicationController
  before_action :set_safe, only: [:show, :edit, :update, :destroy]

  # GET /saves
  # GET /saves.json
  def index
    @saves = Safe.all
  end

  # GET /saves/1
  # GET /saves/1.json
  def show
  end

  # GET /saves/new
  def new
    @safe = Safe.new
    @safe.game_id = params[:game_id]
  end

  # GET /saves/1/edit
  def edit
  end

  # POST /saves
  # POST /saves.json
  def create
    @safe = Safe.new(safe_params)

    @safe.save
    player = Player.find_by_id(@safe.player_id)
    player.saves += 1
    owns = Ownership.where('player_id = ?',player.id)
    owns.each do |own|
      user = User.find(own.user_id)
      points = user.points + 1
      user.update_column(:points, points)
    end
    player.save

    respond_to do |format|
      if @safe.save
        format.html { redirect_to @safe, notice: 'Save was successfully created.' }
        format.json { render action: 'show', status: :created, location: @safe }
        format.js { redirect_to game_path(@safe.player_id), notice: 'Save was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saves/1
  # PATCH/PUT /saves/1.json
  def update
    respond_to do |format|
      if @safe.update(safe_params)
        format.html { redirect_to @safe, notice: 'Safe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @safe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saves/1
  # DELETE /saves/1.json
  def destroy
    @safe.destroy
    respond_to do |format|
      format.html { redirect_to saves_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safe
      @safe = Safe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safe_params
      params.require(:safe).permit(:game_id, :sTime, :player_id)
    end
end
