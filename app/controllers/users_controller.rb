class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_filter :save_login_state, :only => [:new, :create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to controller: 'sessions', action: 'home', :username_or_email => @user.username, :login_password => @user.password }
        format.json { render action: 'sessions/home' , status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        now = Time.now
        dob = @user.dob
        age = now.year - dob.year
        if dob.month > now.month or (dob.month == now.month and dob.day > now.day)
          age = age - 1
        end
        @user.update_column(:age, age)
        format.html { redirect_to sessions_profile_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def buy_player
    selected_player = Player.find_by_id(params[:player_id])
    user = User.find session[:user_id]
    #h = Hash[:p => selected_player, :u => user]
    if user.budget >= selected_player.value
      purchase = Ownership.new
      purchase.player_id = selected_player.id
      purchase.user_id = user.id
      reduced_budget = user.budget - selected_player.value
      user.update_column(:budget, reduced_budget)
      purchase.save
      flash[:notice] = "Successfully bought #{selected_player.full_name}!"
      redirect_to controller: 'sessions', action: 'home'
    else
      flash[:notice] = "Sorry, you do not have sufficient funds to buy this player"
      redirect_to controller: 'sessions', action: 'home'
    end
  end

  def list_players
    owns = Ownership.find_all_by_user_id(session[:user_id])
    players = []
    owns.each do |p|
      player = Player.find(p.player_id)
      players.append(player)
    end
    render locals: {:players => players}
  end

  def sell_player
    selected_player = Player.find_by_id(params[:player_id])
    player_id = params[:player_id]
    own = Ownership.where(:player_id => player_id, :user_id => session[:user_id]).first
    user = User.find session[:user_id]
    increased_budget = user.budget + selected_player.value
    user.update_column(:budget, increased_budget)
    own.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fName, :lName, :username, :password, :gender, :dob, :email, :favClub, :password_confirmation)
    end
end
