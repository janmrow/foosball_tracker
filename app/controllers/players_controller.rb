class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @players = Player.order(sort_column + " " + sort_direction)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Player created"
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params_avatar)
    @player.update_attribute(:avatar, params[:player][:avatar])
    flash[:success] = "Avatar updated"
    redirect_to player_path(@player)
  end

  private

    def player_params
      params.require(:player).permit(:firstname, :lastname, :nickname, :avatar)
    end

    def player_params_avatar
      params.permit(:avatar)
    end

    def sort_column
      Player.column_names.include?(params[:sort]) ? params[:sort] : "position"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
