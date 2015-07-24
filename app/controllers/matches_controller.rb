class MatchesController < ApplicationController
  def new
    @match = Match.new
    @player = Player.all
  end

  def create
    if @match = Match.create(match_params)
      @winner = Player.find(params[:match][:winner_player_id])
      @winner.update_rank

      @loser = Player.find(params[:match][:loser_player_id])
      @loser.update_rank

      Player.update_position
  end
    redirect_to @match
  end

  def show
    @match = Match.find(params[:id])
  end

  private

    def match_params
      params.require(:match).permit(:loserscore, :winner_player_id, :loser_player_id, :date)
    end
end
