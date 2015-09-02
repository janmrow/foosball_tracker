require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let!(:player1) { FactoryGirl.create :player }
  let!(:player2) { FactoryGirl.create :player }

  describe "GET #index" do
    it "returns http success and renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end

    context "there are no players in rank" do
      it "assigns @players" do
        get :index
        expect(assigns(:players).count).to eq 0
      end
    end

    context "there are two players in rank and they are sort correct" do
      it "assigns @players" do
        match = Match.create(loserscore: 1, winner_player_id: player1.id,
                    loser_player_id: player2.id, date: '01/01/2015')
        get :index
        expect(assigns(:players).count). to eq 2
      end

      it "winner of the match should be first in rank" do
        match = Match.create(loserscore: 1, winner_player_id: player1.id,
                    loser_player_id: player2.id, date: '01/01/2015')
        get :index
        players = assigns(:players)
        expect(players.first). to eq player1
      end
    end
  end

  describe "GET #new" do
    it "returns http success and renders the new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
    end

    it "assigns @player" do
      player = Player.new
      get :new
      expect(assigns(:player)) == player
    end
  end

  describe "GET #show" do
    context "when player exists" do
      it "returns http success and renders the show template" do
        get :show, id: player1.id
        expect(response).to have_http_status(:success)
        expect(response).to render_template("show")
      end
    end

    context "when player doesn't exist" do
      it "render error template" do
        get :show, id: Player.last.id + 1
        expect(response).to render_template('error')
      end
    end
  end

  describe "GET #edit" do
    context "when player exists" do
      it "returns http success and renders the edit template" do
        get :edit, id: player1.id
        expect(response).to have_http_status(:success)
        expect(response).to render_template("edit")
      end
    end

    context "when player doesn't exist" do
      it "render error template" do
        get :show, id: Player.last.id + 1
        expect(response).to render_template('error')
      end
    end
  end

  describe "POST #create" do
    context "when data is valid" do
      it "add new player to database and redirect to player path and display flash" do
        number_of_players = Player.count
        post :create, player: { firstname: "Tim", lastname: "Fim", nickname: "tfa" }
        expect(Player.count).to eq number_of_players + 1
        expect(response).to redirect_to player_path(assigns(:player))
        expect(flash[:success]).to be_present
      end

      it "with avatar" do
        file = Rack::Test::UploadedFile.new(File.join(
                                Rails.root,"spec/factories/images/1.png"),"image/png")
        post :create, player: { firstname: "Tim", lastname: "Fim",
                                nickname: "tfa", avatar: file }

        number_of_players = Player.count
        expect(Player.count).to eq number_of_players
        expect(response).to redirect_to player_path(assigns(:player))
        expect(flash[:success]).to be_present
      end

    end

    context "when data is invalid" do
      it "render the error template" do
        post :create, player: { firstname: "Tim" }
        expect(response).to render_template("new")
      end

      it "should add anything to database" do
        number_of_players = Player.count
        post :create, match: { firstname: "Tim" }
        expect(Player.count).to eq number_of_players
      end
    end
  end

  describe "PUT #update" do
    context "when data is valid" do
      it "should update avatar and display flash" do
        file = Rack::Test::UploadedFile.new(File.join(
                                Rails.root,"spec/factories/images/1.png"),"image/png")
        #avatar = File.new(Rails.root + 'spec/factories/images/1.png') 
        put :update, id: player1.id, player: { avatar: file }
        expect(flash[:success]).to be_present
      end
    end

    context "when avatar is mising" do
      it "should redirect to edit page and display flash" do
        request.env["HTTP_REFERER"] = "http://test.host/players/#{player1.id}/edit"
        put :update, id: player1.id
        expect(response).to redirect_to(edit_player_path)
        expect(flash[:danger]).to be_present
      end
    end
  end

end
