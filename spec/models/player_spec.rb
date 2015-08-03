require 'rails_helper'

RSpec.describe Player, type: :model do
  before do 
    @player = FactoryGirl.build(:player)
  end

  subject { @player }

  it { should respond_to(:firstname) }
  it { should respond_to(:lastname) }
  it { should respond_to(:nickname) }
  it { should respond_to(:avatar) }
  it { should respond_to(:rank) }
  it { should respond_to(:position) }
  it { should respond_to(:rank) }

  it { should be_valid }

  context "when firstname is not present" do
    before { @player.firstname = " "}
    it { should_not be_valid }
  end

  context "when lastname is not present" do
    before { @player.lastname = " "}
    it { should_not be_valid }
  end

  context "when nickname is not present" do
    before { @player.nickname = " "}
    it { should_not be_valid }
  end

  context "when nickname is too short" do
    before { @player.nickname = "x" }
    it { should_not be_valid }
  end  

  context "when nickname is too long" do
    before { @player.nickname = "x" * 31 }
    it { should_not be_valid }
  end

  context "when firstname is too short" do
    before { @player.firstname = "x" }
    it { should_not be_valid}
  end

  context "when firstname is too long" do
    before { @player.firstname = "x" * 31 }
    it { should_not be_valid}
  end

  context "when lastname is too short" do
    before { @player.lastname = "x" }
    it { should_not be_valid}
  end

  context "when lastname is too long" do
    before { @player.lastname = "x" * 31 }
    it { should_not be_valid}
  end

  context "when nickname is used" do
    before do
      another_player = @player.dup
      another_player.save
    end
    it { should_not be_valid }
  end

  context "get full name" do
    before { @player.update_attributes(
                      firstname: "John", lastname: "Travolta", nickname: "trav11") }
    it { expect(@player.full_name).to eq "John Travolta (trav11)" }
  end

  context "get some stats" do
    before do
      @player.save
      @player2 = FactoryGirl.create(:player)
      @match = Match.create( { loserscore: 1, winner_player_id: @player.id,
                loser_player_id: @player2.id, date: "15/05/2015" } )
    end
    it { expect(@player.number_of_wins).to eq 1 }
    it { expect(@player2.number_of_losts).to eq 1 }

    it { expect(@player.number_of_matches).to eq 1 }
    it { expect(@player2.number_of_matches).to eq 1 }

    it { expect(@player.points_earned).to eq 10 }
    it { expect(@player2.points_earned).to eq 1 }

    it { expect(@player.points_lost).to eq 1 }
    it { expect(@player2.points_lost).to eq 10 }

    it { expect(@player.simple_rank_points).to eq 1.1}
    it { expect(@player2.simple_rank_points).to eq -0.4}

    it "get ranking position" do
      @players = Player.all
      expect(@players.first).to eq @player
    end
  end

  context "update ranking position and player's points" do
    before do
      @player.save
      @player2 = FactoryGirl.create(:player)
      @player3 = FactoryGirl.create(:player)
      @player4 = FactoryGirl.create(:player)
      @match = Match.create( { loserscore: 1, winner_player_id: @player.id,
                               loser_player_id: @player2.id, date: "15/05/2015" })
      @player.update_rank
      @player2.update_rank
      Player.update_position
      @player.reload
      @player2.reload
    end

    it { expect(@player.position).to eq 1 }
    it { expect(@player2.position).to eq 2 }
    it { expect(@player.rank).to eq 1.1 }
    it { expect(@player2.rank).to eq -0.4 }

    it "player which has matches should be in simple rank" do
      expect(Player.simple_rank(Array(@player))).to eq Array(@player)
    end
    it "player which has no matches shouldn't be in simple rank" do
      expect(Player.simple_rank(Array(@player3))).to eq []
    end

    it "top players array should be empty" do
      expect(Player.top_players).to eq []
    end

    it "" do
      Match.create( { loserscore: 1, winner_player_id: @player.id,
                               loser_player_id: @player2.id, date: "16/05/2015" })
      Match.create( { loserscore: 1, winner_player_id: @player3.id,
                               loser_player_id: @player4.id, date: "15/05/2015" })
      Player.update_position

      @top_players = Player.top_players
      expect(@top_players.count).to eq 4
      expect(@top_players[0]).to eq @player
      expect(@top_players[1]).to eq @player3
    end
  end  
end
