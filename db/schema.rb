# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091029191406) do

  create_table "clients", :force => true do |t|
    t.string   "company"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "client_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estimates", :force => true do |t|
    t.integer  "job_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "dollar_value"
  end

  create_table "invoiceitems", :force => true do |t|
    t.integer  "invoice_id"
    t.string   "item"
    t.string   "description"
    t.float    "unitcost"
    t.float    "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.integer  "contact_id"
    t.integer  "job_id"
    t.datetime "invoice_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices_taxes", :id => false, :force => true do |t|
    t.integer "invoice_id"
    t.integer "tax_id"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "client_id"
    t.integer  "estimate_id"
    t.text     "description"
    t.string   "status"
    t.float    "dollar_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "job_id"
    t.string   "task"
    t.string   "status_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxes", :force => true do |t|
    t.string   "tax"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
