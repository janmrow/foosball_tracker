class PlayersController < ApplicationController
  
  def index
    @players = Player.new
    @players = @players.simple_rank
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    redirect_to :root
  end

  private

    def player_params
      params.require(:player).permit(:firstname, :lastname, :nickname, :avatar)
    end
end
