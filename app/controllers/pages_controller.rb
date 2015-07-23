class PagesController < ApplicationController
  def home
    @players = Player.new
    @players = @players.simple_rank.to_a
    @top_players = []
    @top_players.concat([@players[0], @players[1], @players[2], @players[4]])
  end

  def about
  end
end
