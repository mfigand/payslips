# frozen_string_literal: true

FactoryBot.define do
  factory :payslip do
    registry_id { RegistryIdService.generate }
    vat_idNumber { '97084172E' }
    date { Date.parse('20181231') }
    gross { 2486.25 }
    national_insurance_rate { 5.33 }
    amount_national_insurance_deductions { 124.35 }
    tax_rate { 12.12 }
    amount_taxes { 298.32 }
    net { 2063.37 }
    raw_data { '00000000000197084172E201812310024860005000001243012000002983200206337' }
  end
end
