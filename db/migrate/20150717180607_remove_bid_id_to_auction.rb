class RemoveBidIdToAuction < ActiveRecord::Migration
  def change
    remove_column :auctions, :bid_id
  end
end
