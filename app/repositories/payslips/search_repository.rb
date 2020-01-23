# frozen_string_literal: true

module Payslips
  class SearchRepository
    def self.resolve(query)
      Payslip.where(date: query.date..query.date.end_of_month)
    end
  end
end
