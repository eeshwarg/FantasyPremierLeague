class SessionsController < ApplicationController

  before_action :authenticate_user, :only => [:home, :profile, :settings]
  before_action :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome! You are logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def home
    owns = Ownership.find_all_by_user_id(session[:user_id])
    gks = []
    defs = []
    mids = []
    fwds = []
    players = []
    owns.each do |own|
      player = Player.find(own.player_id)
      case player.position
        when "GK"
          gks.append(player)
          players.append(player)
        when "DEF"
          defs.append(player)
          players.append(player)
        when "MID"
          mids.append(player)
          players.append(player)
        when "FWD"
          fwds.append(player)
          players.append(player)
      end
    end
    render :locals => {:players => players, :gks => gks, :defs => defs, :mids => mids, :fwds => fwds}
  end

  def profile
  end

  def settings
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

end
