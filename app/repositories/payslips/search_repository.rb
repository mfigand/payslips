# frozen_string_literal: true

module Payslips
  class SearchRepository
    def self.resolve(query)
      date = query.date
      Payslip.where(date: date..date.end_of_month) if date
    end
  end
end
