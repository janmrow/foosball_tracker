require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  let!(:player1) { FactoryGirl.create :player }
  let!(:player2) { FactoryGirl.create :player }
  let!(:match) { Match.create(loserscore: 1, winner_player_id: player1.id,
                  loser_player_id: player2.id, date: '01/01/2015') }

  describe "GET #new" do
    it "returns http success and renders the new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do

    context "match exists" do
      it "returns http success and renders the show template" do
        get :show, id: match.id
        expect(response).to have_http_status(:success)
        expect(response).to render_template("show")
      end
    end

    context "match doesn't exist" do
      it "render the error template" do
        get :show, id: Player.last.id + 1
        expect(response).to render_template("error")
      end
    end
  end


  describe "POST #create" do
    context "when data is valid" do
      it "returns http success and renders the show template" do
        number_of_matches = Match.count
        post :create, match: {loserscore: 5, winner_player_id: player1.id,
                  loser_player_id: player2.id, date: '02/01/2015' }
        expect(Match.count).to eq number_of_matches + 1
        expect(response).to redirect_to match_path(assigns(:match))
      end
    end

    context "when data is invalid" do
      it "param is mising" do
        post :create, match: { winner_player_id: player1, loser_player_id: player2.id }
        expect(response). to render_template("new")
      end
    end
  end

end
