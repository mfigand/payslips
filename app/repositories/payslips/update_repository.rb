# frozen_string_literal: true

module Payslips
  class UpdateRepository
    def self.resolve(params)
      payslip = Payslip.find(params.id)

      payslip&.update(tax_rate: params.tax_rate)
      payslip
    rescue ActiveRecord::RecordNotFound => e
      { error: e.message }
    end
  end
end
