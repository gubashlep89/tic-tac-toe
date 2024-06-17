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
FactoryBot.define do
  factory :game do
    trait :processing do
      field1 { 'x' }
      field9 { 'x' }
      field3 { 'o' }
      field6 { 'o' }
    end

    trait :finished do
      field1 { 'x' }
      field2 { 'x' }
      field3 { 'x' }
      field7 { 'o' }
      field8 { 'o' }
    end

    trait :draw do
      field1 { 'x' }
      field2 { 'o' }
      field3 { 'x' }
      field4 { 'o' }
      field5 { 'o' }
      field6 { 'x' }
      field7 { 'x' }
      field8 { 'x' }
      field9 { 'o' }
    end
  end
end
