class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :player1, null: false, foreign_key: { to_table: :players }
      t.references :player2, null: false, foreign_key: { to_table: :players }
      t.references :winner, foreign_key: { to_table: :players }
      t.integer :current_player, default: 0
      t.integer :field1, default: 0
      t.integer :field2, default: 0
      t.integer :field3, default: 0
      t.integer :field4, default: 0
      t.integer :field5, default: 0
      t.integer :field6, default: 0
      t.integer :field7, default: 0
      t.integer :field8, default: 0
      t.integer :field9, default: 0

      t.timestamps
    end
  end
end
