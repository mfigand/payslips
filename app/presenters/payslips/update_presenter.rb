# frozen_string_literal: true

module Payslips
  class UpdatePresenter
    attr_accessor :payslip

    def initialize(payslip)
      @payslip = payslip
    end

    def resolve
      payslip.instance_of?(Payslip) ? serialized_payslip : { data: payslip[:error], status: 404 }
    end

    def serialized_payslip
      {}.tap do |sp|
        sp[:data] = Payslips::PayslipSerializer.resolve(payslip)
        sp[:status] = 200
      end
    end
  end
end
