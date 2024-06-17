require 'rails_helper'

describe GameBuilderService do
  describe '#call' do
    let(:player1_name) { Faker::Name.name }
    let(:player2_name) { Faker::Name.name }
    let(:params) { { player1: player1_name, player2: player2_name } }
    let(:result) { GameBuilderService.call(params) }

    context 'valid params' do
      it 'returns game' do
        expect(result.class).to eq(Game)
        expect(result.player1.name).to eq(player1_name)
        expect(result.player2.name).to eq(player2_name)
      end
    end

    context 'player1 invalid' do
      let(:player1_name) { '' }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end

    context 'player2 invalid' do
      let(:player1_name) { '' }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end
  end
end
