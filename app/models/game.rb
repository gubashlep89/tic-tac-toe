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
class Game < ApplicationRecord
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'
  belongs_to :winner, class_name: 'Player', optional: true

  enum current_player: { x: 0, o: 1 }, _prefix: true
  enum field1: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field2: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field3: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field4: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field5: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field6: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field7: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field8: { empty: 0, x: 1, o: 2 }, _prefix: true
  enum field9: { empty: 0, x: 1, o: 2 }, _prefix: true

  WINNING_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ].freeze

  def make_step(field_index)
    return false if winner || draw? || invalid_step?(field_index)

    ActiveRecord::Base.transaction do
      update("field#{field_index}": current_player)
      find_winner
      switch_player unless winner
    end
  end

  def player_name
    find_player.name
  end

  def restart
    update(
      winner: nil,
      current_player: 'x',
      field1: 'empty',
      field2: 'empty',
      field3: 'empty',
      field4: 'empty',
      field5: 'empty',
      field6: 'empty',
      field7: 'empty',
      field8: 'empty',
      field9: 'empty'
    )
  end

  def draw?
    (1..9).each do |i|
      return false if send("field#{i}_empty?")
    end
    true
  end

  def win_condition
    WINNING_COMBINATIONS.each do |condition|
      return condition if condition.all? { |field_index| send("field#{field_index}_#{current_player}?") }
    end
    []
  end

  private

  def invalid_step?(field_index)
    (1..9).exclude?(field_index.to_i) || !send("field#{field_index}_empty?")
  end

  def find_player
    current_player_x? ? player1 : player2
  end

  def find_winner
    update(winner: find_player) if win_condition.any?
  end

  def switch_player
    update(current_player: next_player)
  end

  def next_player
    current_player_x? ? 'o' : 'x'
  end
end
