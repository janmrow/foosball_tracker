require 'rails_helper'

RSpec.describe "AddMatches", type: :request do
  describe "create new match and visit its page" do

    subject { page }

    describe "matches page" do
      before { visit new_match_path }

      it { should have_selector('h1', 'Add new match') }
    end

    describe "create new match" do 
      before { visit new_match_path }

      context "with valid data" do
        let!(:player1) { FactoryGirl.create :player }
        let!(:player2) { FactoryGirl.create :player } 

        before do
          visit new_match_path 
          page.select(player1.firstname, from: 'match_winner_player_id')
          page.select(player2.firstname, from: 'match_loser_player_id')
          fill_in "match_date", with: "05/05/2015"
          click_button 'Add match'
        end

        it { should have_selector('h3', player1.full_name) }
        it { should have_selector('h3', player2.full_name) }
      end

      context "between player and himself" do 

      end

      context "without date" do

      end

    end
  end
end
