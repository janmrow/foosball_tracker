class PagesController < ApplicationController
  def home
    @players = Player.all
    if @players.count > 3
      @top_players = []
      @top_players.concat([@players[0], @players[1], @players[2], @players[3]])
    end
  end

  def about
  end
end
