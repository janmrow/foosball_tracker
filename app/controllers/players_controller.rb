class PlayersController < ApplicationController
  
  def index
    @players = Player.all
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
      params.require(:player).permit(:firstname, :lastname)
    end
end
