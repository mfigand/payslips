# frozen_string_literal: true

module Payslips
  class IndexPresenter
    attr_accessor :collection

    def initialize(collection)
      @collection = collection
    end

    def resolve
      collection ? serialized_collection : {}
    end

    def serialized_collection
      {}.tap do |sc|
        sc[:data] = collection.map do |payslip|
          Payslips::PayslipSerializer.resolve(payslip)
        end
      end
    end
  end
end
