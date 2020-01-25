# frozen_string_literal: true

module Payslips
  class UpdateInteractor
    attr_accessor :id, :tax_rate

    def initialize(id, params)
      @id = id
      @tax_rate = params[:tax_rate].to_f
    end

    def resolve
      payslip = Payslips::FindRepository.resolve(id)
      payslip.instance_of?(Payslip) ? update(payslip) : payslip
    end

    def update(payslip)
      Payslips::UpdateRepository.new(payslip, self).resolve
    end
  end
end
