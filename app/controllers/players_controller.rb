class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @players = Player.order(sort_column + " " + sort_direction)
    @players = Player.simple_rank(@players)
  end

  def show
    begin
      @player = Player.find(params[:id])
      @wins = @player.wins.order("date DESC")
      @losts = @player.losts.order("date DESC")
    rescue ActiveRecord::RecordNotFound => e
      render 'error'
    end
  end

  def new
    @player = Player.new
  end

  def create
    begin
      @player = Player.new(player_params)
      @player.rank = 0
      if @player.save
        flash[:success] = "Player created"
      end
      redirect_to player_path(@player)
    rescue
      render 'new'
    end
  end

  def edit
    begin
      @player = Player.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render 'error'
    end
  end

  def update
    @player = Player.find(params[:id])
    begin
      @player.update_attributes(player_params_avatar)
      flash[:success] = "Avatar updated"
      redirect_to player_path(@player)
    rescue ActionController::ParameterMissing => e
      flash[:danger] = "First choose avatar file"
      redirect_to :back
    end
  end

  private

    def player_params
      params.require(:player).permit(:firstname, :lastname, :nickname, :avatar)
    end

    def player_params_avatar
      params.require(:player).permit(:avatar)
    end

    def sort_column
      Player.column_names.include?(params[:sort]) ? params[:sort] : "position"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
