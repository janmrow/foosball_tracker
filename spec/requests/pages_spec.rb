require 'rails_helper'

RSpec.describe "Pages", type: :request do

  subject { page }

  before do
    @player = FactoryGirl.create(:player)
    @player2 = FactoryGirl.create(:player)
    @player3 = FactoryGirl.create(:player)
    @player4 = FactoryGirl.create(:player)
    @match = Match.create(loserscore: 1, winner_player_id: @player.id, loser_player_id: @player2.id, date: '2015-05-01')
    @match2 = Match.create(loserscore: 5, winner_player_id: @player.id, loser_player_id: @player3.id, date: '2015-05-02')
    Match.create(loserscore: 1, winner_player_id: @player.id, loser_player_id: @player4.id, date: '2015-05-03')
    Match.create(loserscore: 1, winner_player_id: @player2.id, loser_player_id: @player4.id, date: '2015-05-04')
    # in rank: player, player2, player3, player4
  end

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Home - FoosballTracker') }
    it { should have_selector('h1', text: 'Hello!') }
    it { should have_selector(:link, 'New match') }
    it { should have_selector(:link, 'New player') }

    context "when there are top players" do
      it { should_not have_content('There are no top players yet') }
      it { should have_content(@player.nickname) }
    end

    context "when click on player avatar" do
      #before { find('.thumbnail').first.click }
      #before { click_link(@player.id) }

      # before { find(:xpath, '//a/img[@alt="#{@player.id}"]').click }
      # find(:xpath, "//img[@class='avatar']/@alt").text.should match /some text/
      #before { find(:xpath, "//img[@alt='1']").click }

      #before { click_link(@player.nickname) }
      # before { find("##{@player.nickname}").click }
      # it { print html }
      # it { should have_title(@player.full_name.to_s) }
      # it { should have_selector('h3', text: 'Statistics') }
      # it "should go to edit avatar page" do
      #   click_link('Change avatar')
      #   should have_title('Edit avatar')
      # end
    end

    context "when can't find top players" do
      before do
        @match.delete
        @match2.delete
        visit root_path
      end
      it { should have_content('There are no top players yet') }
    end

    it "buttons should works" do
      click_link('New match')
      should have_title('Add new match')
      visit root_path

      click_link('New player')
      should have_title('Add new player')
      visit root_path
      
      click_link('Go to rank')
      should have_title('Ranking')
    end
  end

  describe "Ranking" do
    before { visit players_path }

    it { should have_title('Ranking - FoosballTracker') }
    it { should have_selector('h1', text: 'List of players') }
    it { should have_content(@player.full_name) }
    # below is default sorting by position, @player should be first in ranking etc.
    it { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[1]').text eq @player.full_name }
    it { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[2]').text eq @player2.full_name }
    it { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[3]').text eq @player3.full_name }
    it { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[4]').text eq @player4.full_name }

    context "when sort by position desending" do
      before { click_link('Position') }
      it { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[1]').text eq @player4.full_name }
    end

    # context "click on player name" do
    #   before { find(:xpath, '(//tbody/tr/td[@class="col-md-2"]/a)[1]').click } 

    #   it { should have_title(@player.full_name) }    
    # end

  end

  describe "About" do
    before { visit pages_about_path }

    it { should have_selector('h1', text: 'Hello, I am Jan') }
  end

  it "should have correct links on the left menu" do
    visit root_path
    
    click_link('Ranking')
    should have_title('Ranking')

    click_link('Add Player')
    should have_title('Add new player')

    click_link('Add Match')
    should have_title('Add new match')
  
    click_link('About')
    should have_title('About')
  end

end
