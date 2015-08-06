player1 = Player.create(
                        firstname: "John", lastname: "Malkon", nickname: "jonmal",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/1.png"))

player2 = Player.create(
                        firstname: "Bella", lastname: "Ho", nickname: "bibi",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/2.jpg"))

player3 = Player.create(
                        firstname: "Jack", lastname: "Waste", nickname: "waster99",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/3.jpg"))

player4 = Player.create(
                        firstname: "Tim", lastname: "Ferris", nickname: "ferran",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/4.jpg"))

player5 = Player.create(
                        firstname: "Kate", lastname: "Jim", nickname: "kateji",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/5.jpg"))

player6 = Player.create(
                        firstname: "Ella", lastname: "Bloom", nickname: "eloa",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/6.jpg"))

player7 = Player.create(
                        firstname: "Pat", lastname: "War", nickname: "paterson",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/7.jpg"))

player8 = Player.create(
                        firstname: "Jasmine", lastname: "Pet", nickname: "pat6",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/8.jpg"))

player9 = Player.create(
                        firstname: "Allan", lastname: "Keats", nickname: "kele",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/9.png"))

player10 = Player.create(
                        firstname: "Greg", lastname: "Belt", nickname: "belt11",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/10.jpg"))

player11 = Player.create(
                        firstname: "Nina", lastname: "Andre", nickname: "ninas",
                        avatar: File.new("#{Rails.root}/public/examples/avatars/11.jpg"))


Match.create(loserscore: 4, winner_player_id: player1.id, loser_player_id: player3.id, date: "01/04/2015")
Match.create(loserscore: 8, winner_player_id: player1.id, loser_player_id: player11.id, date: "05/04/2015")
Match.create(loserscore: 1, winner_player_id: player3.id, loser_player_id: player10.id, date: "07/04/2015")
Match.create(loserscore: 2, winner_player_id: player5.id, loser_player_id: player7.id, date: "09/04/2015")
Match.create(loserscore: 5, winner_player_id: player5.id, loser_player_id: player6.id, date: "12/04/2015")
Match.create(loserscore: 9, winner_player_id: player7.id, loser_player_id: player2.id, date: "16/04/2015")
Match.create(loserscore: 5, winner_player_id: player7.id, loser_player_id: player1.id, date: "20/04/2015")
Match.create(loserscore: 4, winner_player_id: player7.id, loser_player_id: player1.id, date: "30/04/2015")
Match.create(loserscore: 2, winner_player_id: player9.id, loser_player_id: player10.id, date: "01/05/2015")
Match.create(loserscore: 8, winner_player_id: player8.id, loser_player_id: player4.id, date: "08/05/2015")
Match.create(loserscore: 3, winner_player_id: player7.id, loser_player_id: player5.id, date: "09/05/2015")
Match.create(loserscore: 1, winner_player_id: player11.id, loser_player_id: player4.id, date: "21/05/2015")
Match.create(loserscore: 3, winner_player_id: player5.id, loser_player_id: player3.id, date: "24/05/2015")
Match.create(loserscore: 8, winner_player_id: player4.id, loser_player_id: player2.id, date: "06/06/2015")
Match.create(loserscore: 5, winner_player_id: player2.id, loser_player_id: player7.id, date: "09/06/2015")
Match.create(loserscore: 6, winner_player_id: player4.id, loser_player_id: player3.id, date: "16/06/2015")
Match.create(loserscore: 7, winner_player_id: player11.id, loser_player_id: player1.id, date: "20/06/2015")
Match.create(loserscore: 8, winner_player_id: player5.id, loser_player_id: player2.id, date: "24/06/2015")
Match.create(loserscore: 1, winner_player_id: player11.id, loser_player_id: player5.id, date: "26/06/2015")
Match.create(loserscore: 6, winner_player_id: player7.id, loser_player_id: player11.id, date: "09/07/2015")
Match.create(loserscore: 3, winner_player_id: player3.id, loser_player_id: player2.id, date: "19/07/2015")

# do some stuff from controller
players = Player.all

players.each do |player|
  player.update_rank
end

Player.update_position
