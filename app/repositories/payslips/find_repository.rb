# frozen_string_literal: true

module Payslips
  class FindRepository
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def find
      Payslip.find(id)
    rescue ActiveRecord::RecordNotFound => e
      { error: e.message }
    end
  end
end
