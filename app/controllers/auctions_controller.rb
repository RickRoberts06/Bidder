class AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
      if @auction.save
        redirect_to root_path, notice: "Auction created!"
      else
        flash[:alert] = "Couldn't create your auction."
        render "new"
      end
  end

  def destroy
    @auction = Auction.find params[:id]

    if @auction.destroy
      redirect_to root_path, notice: "Auction was deleted!"
    else
      redirect_to root_path, alert: "Couldn't delete the auction."
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price, :aasm_state, :starting_price)
  end
end
