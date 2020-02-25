# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_25_025401) do

  create_table "address_demands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "demand_id", null: false
    t.string "province"
    t.string "district"
    t.string "commune"
    t.string "addr_detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demand_id"], name: "index_address_demands_on_demand_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "teacher_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_comments_on_teacher_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "demands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subject"
    t.integer "number_student"
    t.string "level_class"
    t.float "time_per_session"
    t.integer "fee"
    t.integer "status"
    t.integer "status_teach"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_demands_on_user_id"
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "teacher_id", null: false
    t.float "point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_rates_on_teacher_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "teach_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "demand_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demand_id"], name: "index_teach_offers_on_demand_id"
    t.index ["teacher_id"], name: "index_teach_offers_on_teacher_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "graduate"
    t.string "address"
    t.string "subject"
    t.string "time"
    t.string "level_study"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.string "email"
    t.string "phone"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "address_demands", "demands"
  add_foreign_key "comments", "teachers"
  add_foreign_key "comments", "users"
  add_foreign_key "demands", "users"
  add_foreign_key "rates", "teachers"
  add_foreign_key "rates", "users"
  add_foreign_key "teach_offers", "demands"
  add_foreign_key "teach_offers", "teachers"
  add_foreign_key "teachers", "users"
end
