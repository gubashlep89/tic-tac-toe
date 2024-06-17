require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views

  describe '#show' do
    let(:player1) { FactoryBot.create(:player) }
    let(:player2) { FactoryBot.create(:player) }
    let(:game) { FactoryBot.create(:game, player1:, player2:) }

    context 'new game' do
      it 'renders the show template' do
        get(:show, params: { id: game.id })
        expect(response).to render_template('show')
        expect(response.body).to match %r{.*turn</h2>}
      end
    end

    context 'finished game' do
      let(:game) { FactoryBot.create(:game, :finished, player1:, player2:, winner: player1) }

      it 'renders the show template' do
        get(:show, params: { id: game.id })
        expect(response).to render_template('show')
        expect(response.body).to match(/Winner/)
      end
    end

    context 'draw game' do
      let(:game) { FactoryBot.create(:game, :draw, player1:, player2:) }

      it 'renders the show template' do
        get(:show, params: { id: game.id })
        expect(response).to render_template('show')
        expect(response.body).to match %r{.*Draw in the game</h1>}
      end
    end
  end

  describe '#create' do
    context 'when players presence' do
      let(:player1) { FactoryBot.create(:player) }
      let(:player2) { FactoryBot.create(:player) }

      it 'redirects show path' do
        post(:create, params: { player1: player1.name, player2: player2.name })
        game = Game.last

        expect(response).to redirect_to(game_path(game))
      end
    end

    context 'when players empty' do
      it 'redirects show path' do
        post(:create, params: { player1: '', player2: '' })

        expect(response).to redirect_to(new_game_path)
      end
    end
  end
end
