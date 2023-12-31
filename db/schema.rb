# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_08_071953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "kind", null: false
    t.string "content", null: false
    t.text "note"
    t.integer "size"
    t.datetime "due"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.uuid "step_id", null: false
    t.string "state_kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_progresses_on_item_id", unique: true
    t.index ["step_id"], name: "index_progresses_on_step_id"
  end

  create_table "step_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "step_id", null: false
    t.integer "wip_limit"
    t.boolean "has_pre_queue", null: false
    t.boolean "has_post_queue", null: false
    t.boolean "allow_idea", null: false
    t.boolean "allow_add", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_step_settings_on_step_id"
  end

  create_table "steps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "work_flow_id", null: false
    t.integer "position", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_flow_id", "position"], name: "index_steps_on_work_flow_id_and_position", unique: true
    t.index ["work_flow_id"], name: "index_steps_on_work_flow_id"
  end

  create_table "work_flows", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "progresses", "items"
  add_foreign_key "progresses", "steps"
  add_foreign_key "step_settings", "steps"
  add_foreign_key "steps", "work_flows"
end
