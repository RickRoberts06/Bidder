class AddBidIdToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :bid, index: true, foreign_key: true
  end
end
