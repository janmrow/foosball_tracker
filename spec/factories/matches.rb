FactoryGirl.define do
  factory :match do
    loserscore { 1 }
    winner_player_id { 1 }
    loser_player_id { 2 } 
    date { '2015-06-06' }
  end
end