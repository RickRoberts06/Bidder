class AddStartingPriceToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :starting_price, :integer
  end
end
