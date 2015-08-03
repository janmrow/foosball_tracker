require 'rails_helper'

RSpec.describe "AddPlayers", type: :request do
  describe "create new player and visit his page" do

    subject { page }

    describe "players page" do
      before { visit new_player_path }

      it { should have_selector('h1', text: 'Add new player') }
    end

    describe "create new player" do
      before { visit new_player_path }


      context "with valid data" do
        let(:firstname) { "John" }
        let(:lastname) { "Smith" }
        let(:nickname) { "smithy99" }

        before do 
          fill_in "player_firstname", with: firstname
          fill_in "player_lastname", with: lastname
          fill_in "player_nickname", with: nickname
          click_button "Add player"
        end

        it { should have_selector('h2', text: nickname ) }
        it { should have_selector('div.alert', text: "Player created")}
      end

      context "without nickname" do
        before do
          visit new_player_path        
          click_button "Add player"
        end
        it { should have_selector('h1', text: 'Add new player') }
      end

    end
  end
end
