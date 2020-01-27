# frozen_string_literal: true

module Payslips
  class ParserService
    class << self
      def parse(payslip)
        {}.tap do |p|
          p[:registry_id] = payslip[ranges[:registry_id]]
          p[:vat_idNumber] = payslip[ranges[:vat_idNumber]]
          p[:date] = Date.parse(payslip[ranges[:date]])
          p[:gross] = payslip[ranges[:gross]].to_f / 100
          p[:national_insurance_rate] = payslip[ranges[:national_insurance_rate]].to_f / 100
          p[:amount_national_insurance_deductions] = payslip[ranges[:amount_national_insurance_deductions]].to_f / 100
          p[:tax_rate] = payslip[ranges[:tax_rate]].to_f / 100
          p[:amount_taxes] = payslip[ranges[:amount_taxes]].to_f / 100
          p[:net] = payslip[ranges[:net]].to_f / 100
          p[:raw_data] = payslip
        end
      end

      def ranges
        {}.tap do |ranges|
          ranges[:registry_id] = 0...12
          ranges[:vat_idNumber] = 12...21
          ranges[:date] = 21...29
          ranges[:gross] = 29...37
          ranges[:national_insurance_rate] = 37...41
          ranges[:amount_national_insurance_deductions] = 41...49
          ranges[:tax_rate] = 49...53
          ranges[:amount_taxes] = 53...61
          ranges[:net] = 61...69
        end
      end
    end
  end
end
