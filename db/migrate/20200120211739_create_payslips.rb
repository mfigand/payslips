class CreatePayslips < ActiveRecord::Migration[5.2]
  def change
    create_table :payslips do |t|
      t.string :registry_id, null: false, unique: true, index: true
      t.string :vat_idNumber, null: false, index: true
      t.date :date, null: false, index: true
      t.float :gross, scale: 2, null: false, index: true
      t.float :national_insurance_rate, scale: 2, null: false, index: true
      t.float :amount_national_insurance_deductions, scale: 2, null: false, index: true
      t.float :tax_rate, scale: 2, null: false, index: true
      t.float :amount_taxes, scale: 2, null: false, index: true
      t.float :net, scale: 2, null: false, index: true
      t.string :raw_data, null: false, index: true

      t.timestamps
    end

    add_index :payslips, :created_at
    add_index :payslips, :updated_at
  end
end
