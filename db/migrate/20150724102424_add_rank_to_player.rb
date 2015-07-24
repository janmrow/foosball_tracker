class AddRankToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :rank, :decimal, precision: 8, scale: 2
  end
end
