class CreateAuctions < ActiveRecord::Migration
  def change
    create_table "auctions", force: :cascade do |t|
    t.string   "title"
    t.text     "details"
    t.datetime "ends_on"
    t.integer  "reserve_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "aasm_state"
    end
  end
end
