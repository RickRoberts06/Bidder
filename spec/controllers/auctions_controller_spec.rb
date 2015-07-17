require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates a new auction variable" do
      get :new
      expect(assigns(:auction)).to be_a_new Auction
    end
  end

  describe "#create" do
    context "user not signed in" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to new_session_path
      end
    end
    context "user signed in" do
      before do
        user = create(:user)
        # this is setting the session[:user_id] as part of the request
        request.session[:user_id] = user.id
      end

      context "with valid parameters" do
        def valid_request
          post :create, auction: attributes_for(:auction)
        end

        it "changes the auctions count by +1" do
          expect { valid_request }.to change { Auction.count }.by(1)
        end

        it "redirects to the new auction show page" do
          valid_request
          expect(response).to redirect_to auction_path(Auction.last)
        end

        it "sets a flash notice message" do
          valid_request
          expect(flash[:notice]).to be
        end
      end

      context "with invalid parameters" do

      end
    end
  end
end
