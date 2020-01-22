# frozen_string_literal: true

module Payslips
  class SearchRepository
    def self.resolve(query)
      # binding.pry
      # "20181231" =~ /^201812/
      Payslip.where('date REGEXP ?', "^#{query.date}")
    end
  end
end
