# frozen_string_literal: true

module Payslips
  class UpdatePresenter
    attr_reader :payslip

    def initialize(payslip)
      @payslip = payslip
    end

    def resolve
      payslip.instance_of?(Payslip) ? serialized_payslip : { data: payslip[:error], status: 404 }
    end

    private

    def serialized_payslip
      {}.tap do |sp|
        sp[:data] = Payslips::PayslipSerializer.new(payslip).serialize
        sp[:status] = 200
      end
    end
  end
end
