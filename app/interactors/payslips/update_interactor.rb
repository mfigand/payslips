# frozen_string_literal: true

module Payslips
  class UpdateInteractor
    attr_accessor :id, :tax_rate

    def initialize(id, params)
      @id = id
      @tax_rate = params[:tax_rate]
    end

    def resolve
      Payslips::UpdateRepository.resolve(self)
    end
  end
end
