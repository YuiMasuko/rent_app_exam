ActiveRecord::Schema.define(version: 2021_08_05_045226) do

  create_table "estates", force: :cascade do |t|
    t.text "name"
    t.integer "price"
    t.text "adress"
    t.integer "year"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "route"
    t.string "station_name"
    t.integer "walk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
