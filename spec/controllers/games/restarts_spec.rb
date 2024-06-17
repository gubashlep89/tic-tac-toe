require 'rails_helper'

RSpec.describe Games::RestartsController, type: :controller do
  let(:player1) { FactoryBot.create(:player) }
  let(:player2) { FactoryBot.create(:player) }
  let(:game) { FactoryBot.create(:game, player1:, player2:) }

  describe '#create' do
    it 'renders the show template with new game' do
      post(:create, params: { game_id: game.id })
      expect(response).to redirect_to(game_path(game))
    end
  end
end
