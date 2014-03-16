# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140316144029) do

  create_table "assignments", force: true do |t|
    t.integer  "organization_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["organization_id"], name: "index_assignments_on_organization_id"
  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id"

  create_table "associations", force: true do |t|
    t.integer  "organization_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "associations", ["organization_id"], name: "index_associations_on_organization_id"
  add_index "associations", ["project_id"], name: "index_associations_on_project_id"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "bids", force: true do |t|
    t.integer  "time"
    t.integer  "bidder_id"
    t.decimal  "amount"
    t.integer  "issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bounties", force: true do |t|
    t.datetime "expiration"
    t.decimal  "amount"
    t.integer  "currency"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issue_id"
  end

  create_table "issues", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "milestone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.text     "url"
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id"

  create_table "labels", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "github_name"
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github_name"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["github_name"], name: "index_users_on_github_name", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
