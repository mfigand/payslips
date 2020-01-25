# frozen_string_literal: true

module Payslips
  class FindRepository
    def self.resolve(id)
      Payslip.find(id)
    rescue ActiveRecord::RecordNotFound => e
      { error: e.message }
    end
  end
end
