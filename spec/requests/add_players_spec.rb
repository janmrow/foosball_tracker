require 'rails_helper'

RSpec.describe "AddPlayers", type: :request do
  describe "add player" do
    let(:firstname) { "John" }
    let(:lastname) { "Smith" }
    let(:nickname) { "smithy99" }

    it "add new player with valid data" do
      visit new_player_path
      fill_in "player_firstname", with: firstname
      fill_in "player_lastname", with: lastname
      fill_in "player_nickname", with: nickname

      click_button "Add player"
      Player.all.count.should eq 1
      @player = Player.first
      @player.nickname.should eq nickname
      current_path.should eq player_path(1)
      page.should have_content(nickname)
    end

    it "add players without nickname" do
      visit new_player_path
      click_button "Add player"
      current_path should eq new_player_path
    end
  end
end
