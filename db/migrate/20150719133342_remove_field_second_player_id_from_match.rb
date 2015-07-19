class RemoveFieldSecondPlayerIdFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :second_player_id, :integer
  end
end
