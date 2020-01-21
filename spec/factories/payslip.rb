# frozen_string_literal: true

FactoryBot.define do
  factory :payslip do
    registry_id { '000000000001' }
    vat_idNumber { '97084172E' }
    date { '20181231' }
    gross { '00248600' }
    national_insurance_rate { '0500' }
    amount_national_insurance_deductions { '00012430' }
    tax_rate { '1200' }
    amount_taxes { '00029832' }
    net { '00206337' }
  end
end
