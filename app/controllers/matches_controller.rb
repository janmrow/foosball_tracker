class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      @winner = Player.find(params[:match][:winner_player_id])
      @winner.update_rank
      @loser = Player.find(params[:match][:loser_player_id])
      @loser.update_rank
      Player.update_position
      flash[:success] = "Match created"
      redirect_to @match
    else
      render 'new'
    end
  end

  def show
    begin
      @match = Match.find(params[:id])
      @winner = Player.find(@match.winner_player_id)
      @loser = Player.find(@match.loser_player_id)
    rescue ActiveRecord::RecordNotFound => e
      render 'error'
    end    
  end

  def error

  end

  private

    def match_params
      params.require(:match).permit(:loserscore, :winner_player_id, :loser_player_id, :date)
    end
end
