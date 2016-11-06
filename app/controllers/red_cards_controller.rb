class RedCardsController < ApplicationController
  before_action :set_red_card, only: [:show, :edit, :update, :destroy]

  # GET /red_cards
  # GET /red_cards.json
  def index
    @red_cards = RedCard.all
  end

  # GET /red_cards/1
  # GET /red_cards/1.json
  def show
  end

  # GET /red_cards/new
  def new
    @red_card = RedCard.new
    @red_card.game_id = params[:game_id]
  end

  # GET /red_cards/1/edit
  def edit
  end

  # POST /red_cards
  # POST /red_cards.json
  def create
    @red_card = RedCard.new(red_card_params)

    respond_to do |format|
      if @red_card.save
        format.html { redirect_to @red_card, notice: 'Red card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @red_card }
        format.js { redirect_to @red_card, notice: 'Red card was successfully created.'}
      else
        format.html { render action: 'new' }
        format.json { render json: @red_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /red_cards/1
  # PATCH/PUT /red_cards/1.json
  def update
    respond_to do |format|
      if @red_card.update(red_card_params)
        format.html { redirect_to @red_card, notice: 'Red card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @red_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /red_cards/1
  # DELETE /red_cards/1.json
  def destroy
    @red_card.destroy
    respond_to do |format|
      format.html { redirect_to red_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_red_card
      @red_card = RedCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def red_card_params
      params.require(:red_card).permit(:game_id, :rTime, :player_id)
    end
end
