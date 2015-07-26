class MatchesController < ApplicationController
  def new
    @match = Match.new
    @player = Player.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      @winner = Player.find(params[:match][:winner_player_id])
      @winner.update_rank
      @loser = Player.find(params[:match][:loser_player_id])
      @loser.update_rank
      Player.update_position
      redirect_to @match
    else
      redirect_to :back
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  private

    def match_params
      params.require(:match).permit(:loserscore, :winner_player_id, :loser_player_id, :date)
    end
end
