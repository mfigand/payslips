# frozen_string_literal: true

module Payslips
  class PayslipSerializer
    def self.resolve(payslip)
      payslip.slice(:registry_id,
                    :vat_idNumber,
                    :date,
                    :gross,
                    :national_insurance_rate,
                    :amount_national_insurance_deductions,
                    :tax_rate,
                    :amount_taxes,
                    :net,
                    :raw_data)
    end
  end
end
