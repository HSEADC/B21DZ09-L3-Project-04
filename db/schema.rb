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

ActiveRecord::Schema[7.0].define(version: 2023_10_10_214855) do
  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "avatar"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "task_id"
    t.string "image"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"]
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "example"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "tasks_answers", id: false, force: :cascade do |t|
    t.integer "task_id"
    t.integer "answer_id"
    t.index ["answer_id"], name: "index_tasks_answers_on_answer_id"
    t.index ["task_id"], name: "index_tasks_answers_on_task_id"
  end

  add_foreign_key "comments"
end
