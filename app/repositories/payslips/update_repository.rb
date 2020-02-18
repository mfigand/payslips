# frozen_string_literal: true

module Payslips
  class UpdateRepository
    attr_reader :payslip, :gross, :amount_national_insurance_deductions,
                :tax_rate, :amount_taxes, :net, :new_tax_rate

    def initialize(payslip, new_attributes)
      @payslip = payslip
      @gross = payslip.gross
      @amount_national_insurance_deductions = payslip.amount_national_insurance_deductions
      @tax_rate = payslip.tax_rate
      @amount_taxes = payslip.amount_taxes
      @net = payslip.net
      @new_tax_rate = new_attributes.tax_rate
    end

    def resolve
      payslip.update(calc_attributes)
      payslip
    end

    private

    def calc_attributes
      {}.tap do |calc_attributes|
        calc_attributes[:tax_rate] = new_tax_rate
        calc_attributes[:amount_taxes] = gross * (new_tax_rate / 100)
        calc_attributes[:net] = gross - (amount_national_insurance_deductions + calc_attributes[:amount_taxes])
      end
    end
  end
end
