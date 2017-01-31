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

ActiveRecord::Schema.define(version: 20170124144308) do

  create_table "bogestionelections", force: :cascade do |t|
    t.string   "el_titre"
    t.text     "el_descr"
    t.datetime "el_date_debut", default: '2017-01-24 17:14:42', null: false
    t.datetime "el_date_fin",   default: '2017-01-24 17:14:42', null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "bopartis", force: :cascade do |t|
    t.string   "pa_nom"
    t.string   "pa_sigle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidats", force: :cascade do |t|
    t.string   "ca_nom"
    t.string   "ca_prenom"
    t.text     "ca_photo"
    t.text     "ca_program"
    t.text     "ca_program_pdf"
    t.string   "ca_accroche"
    t.integer  "bopartis_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bopartis_id"], name: "index_candidats_on_bopartis_id"
  end

  create_table "competiteurs", force: :cascade do |t|
    t.integer  "candidats_id"
    t.integer  "bogestionelections_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["bogestionelections_id"], name: "index_competiteurs_on_bogestionelections_id"
    t.index ["candidats_id"], name: "index_competiteurs_on_candidats_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "co_nom"
    t.string   "co_sujet"
    t.text     "co_message"
    t.string   "co_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "electeurs", force: :cascade do |t|
    t.text     "ut_nom"
    t.text     "ut_prenom"
    t.date     "ut_date_naissance"
    t.text     "ut_lieu_naissance"
    t.text     "ut_adresse"
    t.integer  "ut_postal"
    t.text     "ut_ville"
    t.text     "ut_pays"
    t.text     "ut_email"
    t.text     "password_digest"
    t.text     "ut_urlIDR"
    t.text     "ut_urlIDV"
    t.boolean  "ut_statut"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "vo_date"
    t.integer  "electeurs_id"
    t.integer  "bogestionelections_id"
    t.integer  "candidats_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["bogestionelections_id"], name: "index_votes_on_bogestionelections_id"
    t.index ["candidats_id"], name: "index_votes_on_candidats_id"
    t.index ["electeurs_id"], name: "index_votes_on_electeurs_id"
  end

end
