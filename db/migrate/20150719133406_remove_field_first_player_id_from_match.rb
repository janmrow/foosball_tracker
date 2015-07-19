class RemoveFieldFirstPlayerIdFromMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :first_player_id, :integer
  end
end
