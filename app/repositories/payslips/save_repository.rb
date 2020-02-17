# frozen_string_literal: true

module Payslips
  class SaveRepository
    attr_reader :payslip_attributes

    def initialize(payslip_attributes)
      @payslip_attributes = payslip_attributes
    end

    def create
      Payslip.create(payslip_attributes)
    end
  end
end
