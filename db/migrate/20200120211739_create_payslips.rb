class CreatePayslips < ActiveRecord::Migration[5.2]
  def change
    create_table :payslips do |t|
      t.string :registry_id, null: false, unique: true, index: true
      t.string :vat_idNumber, null: false, index: true
      t.string :date, null: false, index: true
      t.string :gross, null: false, index: true
      t.string :national_insurance_rate, null: false, index: true
      t.string :amount_national_insurance_deductions, null: false, index: true
      t.string :tax_rate, null: false, index: true
      t.string :amount_taxes, null: false, index: true
      t.string :net, null: false, index: true

      t.timestamps
    end

    add_index :payslips, :created_at
    add_index :payslips, :updated_at
  end
end
