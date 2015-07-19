class RemoveFieldAvatarFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :avatar, :string
  end
end
