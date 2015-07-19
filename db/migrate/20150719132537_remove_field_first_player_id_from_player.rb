class RemoveFieldFirstPlayerIdFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :first_player_id, :integer
  end
end
