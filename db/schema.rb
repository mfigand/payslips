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

ActiveRecord::Schema.define(version: 2020_01_20_211739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payslips", force: :cascade do |t|
    t.string "registry_id", null: false
    t.string "vat_idNumber", null: false
    t.string "date", null: false
    t.string "gross", null: false
    t.string "national_insurance_rate", null: false
    t.string "amount_national_insurance_deductions", null: false
    t.string "tax_rate", null: false
    t.string "amount_taxes", null: false
    t.string "net", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amount_national_insurance_deductions"], name: "index_payslips_on_amount_national_insurance_deductions"
    t.index ["amount_taxes"], name: "index_payslips_on_amount_taxes"
    t.index ["created_at"], name: "index_payslips_on_created_at"
    t.index ["date"], name: "index_payslips_on_date"
    t.index ["gross"], name: "index_payslips_on_gross"
    t.index ["national_insurance_rate"], name: "index_payslips_on_national_insurance_rate"
    t.index ["net"], name: "index_payslips_on_net"
    t.index ["registry_id"], name: "index_payslips_on_registry_id"
    t.index ["tax_rate"], name: "index_payslips_on_tax_rate"
    t.index ["updated_at"], name: "index_payslips_on_updated_at"
    t.index ["vat_idNumber"], name: "index_payslips_on_vat_idNumber"
  end

end
