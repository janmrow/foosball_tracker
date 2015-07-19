class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_player_id
      t.integer :second_player_id
      t.integer :winner_player_id
      t.integer :loserscore
      t.date :date

      t.timestamps
    end
  end
end
