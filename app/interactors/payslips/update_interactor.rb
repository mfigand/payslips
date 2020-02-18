# frozen_string_literal: true

module Payslips
  class UpdateInteractor
    attr_reader :id, :tax_rate

    def initialize(id, params)
      @id = id
      @tax_rate = params[:tax_rate].to_f
    end

    def resolve
      payslip = Payslips::FindRepository.new(id).find
      payslip.instance_of?(Payslip) ? update(payslip) : payslip
    end

    private

    def update(payslip)
      Payslips::UpdateRepository.new(payslip, self).resolve
    end
  end
end
