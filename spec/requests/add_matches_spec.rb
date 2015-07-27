require 'rails_helper'

RSpec.describe "AddMatches", type: :request do
  describe "adding match" do

    subject { page }

    describe "matches page" do
      before { visit new_match_path }

      it { should have_selector('h1', 'Add new match') }
    end

    describe "create new match" do 
      before { visit new_match_path }

      describe "with valid data" do
        let!(:player1) { FactoryGirl.create :player1 }
        let!(:player2) { FactoryGirl.create :player2 } 

        before do
          visit new_match_path 
          page.select(player1.firstname, from: 'match_winner_player_id')
          page.select(player2.firstname, from: 'match_loser_player_id')
          click_button 'Add match'
        end

        it { should have_selector('h3', 'This is match') }
        it { should have_content('Match between: ' + player1.full_name + ' vs ' + player2.full_name)}
      end

      describe "between player and himself" do 

      end

      describe "without date" do

      end

    end
  end
end
