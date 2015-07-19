class AddFieldLoserPlayerIdFromPlayer < ActiveRecord::Migration
  def change
    add_column :players, :loser_player_id, :integer
  end
end
