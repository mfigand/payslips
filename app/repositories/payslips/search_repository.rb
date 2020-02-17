# frozen_string_literal: true

module Payslips
  class SearchRepository
    attr_reader :query

    def initialize(query)
      @query = query
    end

    def by_date
      date = query[:date]
      Payslip.where(date: date..date.end_of_month) if date
    end
  end
end
