# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Player < ApplicationRecord
  has_many :games, inverse_of: :winner, foreign_key: 'winner_id', dependent: :destroy

  validates :name, length: { minimum: 3, maximum: 30 }, allow_blank: false
end
