class RemoveFieldSecondPlayerIdFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :second_player_id, :integer
  end
end
