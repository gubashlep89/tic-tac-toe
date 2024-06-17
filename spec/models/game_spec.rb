# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  player1_id     :integer          not null
#  player2_id     :integer          not null
#  winner_id      :integer
#  current_player :integer          default("x")
#  field1         :integer          default("empty")
#  field2         :integer          default("empty")
#  field3         :integer          default("empty")
#  field4         :integer          default("empty")
#  field5         :integer          default("empty")
#  field6         :integer          default("empty")
#  field7         :integer          default("empty")
#  field8         :integer          default("empty")
#  field9         :integer          default("empty")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:player1) { FactoryBot.create(:player) }
  let(:player2) { FactoryBot.create(:player) }
  let(:game) { FactoryBot.create(:game, player1:, player2:) }

  describe '#make_step' do
    let(:field_index) { 5 }
    before(:each) { game.make_step(field_index) }

    context 'new game' do
      it 'updates field value' do
        expect(game.field5).to eq('x')
      end

      it 'updates player' do
        expect(game.current_player).to eq('o')
      end

      it 'returns empty win condition' do
        expect(game.win_condition).to eq([])
      end

      it 'not finished' do
        expect(game.winner).to be_nil
      end

      it 'not draw' do
        expect(game.draw?).to be_falsey
      end
    end

    context 'last step before win' do
      let(:game) { FactoryBot.create(:game, :processing, player1:, player2:) }

      it 'updates field value' do
        expect(game.field5).to eq('x')
      end

      it 'keeps player' do
        expect(game.current_player).to eq('x')
      end

      it 'returns win condition' do
        expect(game.win_condition).to eq([1, 5, 9])
      end

      it 'finished' do
        expect(game.winner).to eq(player1)
      end

      it 'not draw' do
        expect(game.draw?).to be_falsey
      end
    end

    context 'finished game' do
      let(:game) { FactoryBot.create(:game, :finished, player1:, player2:, winner: player1) }

      it 'not updates field value' do
        expect(game.field5).to eq('empty')
      end

      it 'not updates player' do
        expect(game.current_player).to eq('x')
      end

      it 'returns win condition' do
        expect(game.win_condition).to eq([1, 2, 3])
      end

      it 'finished' do
        expect(game.winner).to eq(player1)
      end

      it 'not draw' do
        expect(game.draw?).to be_falsey
      end
    end

    context 'draw game' do
      let(:game) { FactoryBot.create(:game, :draw, player1:, player2:) }

      it 'not updates field value' do
        expect(game.field5).to eq('o')
      end

      it 'not updates player' do
        expect(game.current_player).to eq('x')
      end

      it 'returns win condition' do
        expect(game.win_condition).to eq([])
      end

      it 'finished' do
        expect(game.winner).to be_nil
      end

      it 'not draw' do
        expect(game.draw?).to be_truthy
      end
    end

    context 'invalid step' do
      let(:game) { FactoryBot.create(:game, :processing, player1:, player2:) }
      shared_examples 'processing game' do |step|
        let(:field_index) { step }

        it 'updates field value' do
          expect(game.field5).to eq('empty')
        end

        it 'updates player' do
          expect(game.current_player).to eq('x')
        end

        it 'returns empty win condition' do
          expect(game.win_condition).to eq([])
        end

        it 'not finished' do
          expect(game.winner).to be_nil
        end

        it 'not draw' do
          expect(game.draw?).to be_falsey
        end
      end

      it_behaves_like 'processing game', '1'
      it_behaves_like 'processing game', '21'
    end
  end

  describe '#restart' do
    before(:each) { game.restart }

    shared_examples 'restarted game' do
      it 'updates field value' do
        expect(game.field5).to eq('empty')
      end

      it 'updates player' do
        expect(game.current_player).to eq('x')
      end

      it 'returns empty win condition' do
        expect(game.win_condition).to eq([])
      end

      it 'not finished' do
        expect(game.winner).to be_nil
      end

      it 'not draw' do
        expect(game.draw?).to be_falsey
      end
    end

    context 'new game' do
      it_behaves_like 'restarted game'
    end

    context 'last step before win' do
      let(:game) { FactoryBot.create(:game, :processing, player1:, player2:) }

      it_behaves_like 'restarted game'
    end

    context 'finished game' do
      let(:game) { FactoryBot.create(:game, :finished, player1:, player2:, winner: player1) }

      it_behaves_like 'restarted game'
    end

    context 'draw game' do
      let(:game) { FactoryBot.create(:game, :draw, player1:, player2:) }

      it_behaves_like 'restarted game'
    end
  end
end
