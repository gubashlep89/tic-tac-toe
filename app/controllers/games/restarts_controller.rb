module Games
  class RestartsController < GamesController
    def create
      game = Game.find(params[:game_id])
      game.restart
      redirect_to game_path(game)
    end
  end
end
