class GamesController < ApplicationController
  before_action :set_game, only: %i[show update]
  def new; end

  def create
    game = GameBuilderService.call(params)
    if game
      redirect_to game_path(game)
    else
      redirect_to new_game_path, alert: 'Please, enter the player name (3 symbols min, 30 max)'
    end
  end

  def show; end

  def update
    @game.make_step(params[:field_index])
    redirect_to game_path(@game)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
