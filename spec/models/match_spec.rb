require 'rails_helper'

RSpec.describe Match, type: :model do
  before do
    @match = Match.new(loserscore: 5, winner_player_id: 1, loser_player_id: 2, date: '2015-06-06')
  end

  subject { @match }

  it { should respond_to(:winner_player_id) }
  it { should respond_to(:loser_player_id) }
  it { should respond_to(:loserscore) }
  it { should respond_to(:date) }

  describe "when winner player id is not present" do
    before { @match.winner_player_id = "" }
    it { should_not be_valid }
  end

  describe "when loser player id is not present" do
    before { @match.loser_player_id = "" }
    it { should_not be_valid }
  end

  describe "when loser score is not present" do
    before { @match.loserscore = "" }
    it { should_not be_valid }
  end

  describe "when date is not present" do
    before { @match.date = "" }
    it { should_not be_valid }
  end

  describe "when date is not valid" do
    before { @match.date = "10/2015" }
    it { should_not be_valid }
  end

  describe "when winner id and looser id is the same" do
    before do
      @match.winner_player_id = 1
      @match.loser_player_id = 1
    end
    it { should_not be_valid }
  end

  describe "when loserscore is mor than 9" do
    before { @match.loserscore = 10 }
    it { should_not be_valid }
  end

  describe "when loserscore is less than 1" do
    before { @match.loserscore = 0 }
    it { should_not be_valid }
  end

end
