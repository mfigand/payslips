# frozen_string_literal: true

class Payslip < ApplicationRecord
  validates :registry_id, :vat_idNumber, :date, :gross,
            :national_insurance_rate, :amount_national_insurance_deductions,
            :tax_rate, :amount_taxes, :net, :raw_data, presence: true
  validates :registry_id, uniqueness: true
end
