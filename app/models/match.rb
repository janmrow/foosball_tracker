class Match < ActiveRecord::Base
  has_one :first_player, class_name: "Player"
end
