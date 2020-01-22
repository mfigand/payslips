# frozen_string_literal: true

class PayslipSaveRepository
  def self.resolve(payslip_attributes)
    Payslip.create(payslip_attributes)
  end
end
