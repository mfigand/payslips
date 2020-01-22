# frozen_string_literal: true

module Payslips
  class SaveRepository
    def self.resolve(payslip_attributes)
      Payslip.create(payslip_attributes)
    end
  end
end
