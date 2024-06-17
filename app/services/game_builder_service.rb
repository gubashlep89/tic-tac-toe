class GameBuilderService
  def self.call(params)
    game = Game.new
    ActiveRecord::Base.transaction do
      game.player1 = Player.create(name: params[:player1])
      game.player2 = Player.create(name: params[:player2])
      game.save
    end
    game
  rescue ActiveRecord::NotNullViolation => _e
    # TODO: parse error messages
  end
end
