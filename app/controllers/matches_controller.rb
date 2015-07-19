class MatchesController < ApplicationController
  def new
    @match = Match.new
    @player = Player.all
  end

  def create
    @match = Match.create(match_params)
    redirect_to @match
  end

  def show
    @match = Match.find(params[:id])
  end

  private

    def match_params
      params.require(:match).permit(:loserscore, :first_player_id)
    end
end
