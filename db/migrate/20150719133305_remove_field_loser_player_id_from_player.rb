class RemoveFieldLoserPlayerIdFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :loser_player_id, :integer
  end
end
