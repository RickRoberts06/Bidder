class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer  "amount"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "auction_id"
      t.timestamps null: false
    end
  end
end
