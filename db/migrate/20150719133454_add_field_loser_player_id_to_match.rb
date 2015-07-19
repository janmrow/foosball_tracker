class AddFieldLoserPlayerIdToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :loser_player_id, :integer
  end
end
