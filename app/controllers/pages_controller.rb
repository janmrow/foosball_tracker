class PagesController < ApplicationController
  def home
    @top_players = Player.top_players
  end

  def about
  end
end
